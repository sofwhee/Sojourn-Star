class PagesController < ApplicationController

  before_action :require_login, except: [:index, :show]
  before_action :set_page, except: [:index, :new, :create]

  def index
    @page_title = 'Archive'
    @chapters = Chapter.all
    @pages = admin_signed_in? ? Page.sorted : Page.published.sorted
    @graphic = "sojourn_planet.png"
    @heading = "Chapters"
    
    render layout: 'gallery'
  end

  def show
    @page_title = "Sojourn Star Page #{@page.page_number}"
  end

  def new
    @page_title = `New Page`
    @chapter_options = Chapter.all.map{ |c| [ c.name, c.id ] }
    @page = Page.new
    @heading = "New Page"

    render layout: 'devise'
  end

  def create
    @page_title = 'Sojourn Star'
    @chapter_options = Chapter.all.map{ |c| [ c.name, c.id ] }

    if params[:commit] == "Draft"
      params[:page].delete_if{ |key, value| key.match(/^published_at/) }
      params[:page][:published_at] == nil
    end

    @page = Page.new(page_params)
    
    if @page.save
      redirect_to pages_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @page_title = "Edit Page #{@page.page_number}"
    @chapter_options = Chapter.all.map{ |c| [ c.name, c.id ] }
    @heading = "Edit Page"

    render layout: 'devise'
  end

  def update
    @page_title = 'Sojourn Star'
    @chapter_options = Chapter.all.map{ |c| [ c.name, c.id ] }

    @page.slug = nil if @page.page_number != params[:page_number]
    if @page.update(page_params)
      # bump_all_pages(@page.id, @page.page_number)
      redirect_to pages_path
    else  
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @page.destroy

    redirect_to pages_path, status: :see_other
  end
  
  private
  def page_params
    params.require(:page).permit(:chapter_id, :page_number, :published_at, :page_image)
  end

  def require_login
    unless admin_signed_in?
      redirect_to root_path
    end
  end

  def set_page
    if admin_signed_in?
      @page = Page.friendly.find(params[:id])
    else
      @page = Page.published.friendly.find(params[:id])
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end

  def bump_all_pages(page_id, page_number)
    puts page_id
    puts page_number
    later_pages = Page.where(`page_number >= #{page_number} and id != #{page_id}`)
    later_pages.each do |cur_page|
      cur_page.update_attribute('page_number', (cur_page.page_number + 1))
    end
  end

end

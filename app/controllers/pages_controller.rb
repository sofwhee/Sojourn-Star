class PagesController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_page, except: [:index, :new, :create]

  def index
    @chapters = Chapter.all
    @pages = admin_signed_in? ? Page.sorted : Page.published.sorted
  end

  def show
  end

  def new
    @chapter_options = Chapter.all.map{ |c| [ c.name, c.id ] }
    @page = Page.new
  end

  def create
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
    @chapter_options = Chapter.all.map{ |c| [ c.name, c.id ] }
    @page = Page.find(params[:id])
  end

  def update
    @chapter_options = Chapter.all.map{ |c| [ c.name, c.id ] }
    @page = Page.find(params[:id])

    if @page.update(page_params)
      bump_all_pages(@page.id, @page.page_number)
      redirect_to pages_path
    else  
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    redirect_to root_path, status: :see_other
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
      @page = Page.find(params[:id])
    else
      @page = Page.published.find(params[:id])
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

class PagesController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_page, except: [:index, :new, :create]

  def index
    @pages = admin_signed_in? ? Page.sorted : Page.published.sorted
  end

  def show
  end

  def new
    @page = Page.new
  end

  def create

    if params[:commit] == "Draft"
      page_params[:published_at] = nil
    elsif params[:commit] == "Publish"
      page_params[:published_at] = lambda { Time.current }
    end

    @page = Page.new(page_params)
    
    if @page.save
      redirect_to @page
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      redirect_to @page
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
    params.require(:page).permit(:cover_image, :chapter, :page_number, :published_at, :page_image)
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
end

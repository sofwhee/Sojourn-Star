class PagesController < ApplicationController
  # has_one_attached :cover_image

  before_action :require_login, except: [:index, :show]

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
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
    params.require(:page).permit(:cover_image, :chapter, :page_number)
  end

  def require_login
    unless admin_signed_in?
      raise ApplicationController::NotAuthorized
    end
  end
end

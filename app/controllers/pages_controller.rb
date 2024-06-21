class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    permit.require(:page).permit(:image, :chapter, :page_number)
  end
end

class PagesController < ApplicationController
  def index
  end

  def new
  end
  
  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def page_params
    permit.require(:page).permit(:chapter, :page, :image)
  end
end

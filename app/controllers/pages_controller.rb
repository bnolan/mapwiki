class PagesController < ApplicationController
  
  def show
    @page = Page.find_or_initialize_by_slug params[:id]
  end
  
  def edit
    @page = Page.find_or_initialize_by_slug params[:id]
  end
  
  def update
    @page = Page.find_by_slug params[:id]
    @page.update_attributes! page_params
    redirect_to @page
  end

  def create
    @page = Page.create! page_params
    redirect_to @page
  end
  
  private
  
  def page_params
    params.require(:page).permit(:name, :content, :latitude, :longitude, :address, :phone, :website)
  end
  
end

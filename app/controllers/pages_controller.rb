class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
    # can use render plain: params[:id] in v 5.0 or higher
    # must use render plain in v 5.1 or higher
    # render text: params[:id]
    # removed because rails renders one thing per controller method
    # render text: @page.title
  end

  def new
    @page = Page.new
  end

  def create
    # removed because of strict param handling (can't just add new params)
    # @page = Page.new(params)
    # to get params as json
    # render text: params.to_json
    # show class of params
    # render text: params.class  
    # page_params = params.require(:page).permit(:title, :body, :slug)
    @page = Page.new(page_params)
    @page.save
    redirect_to @page
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    # more concise to call page_params as own method
    # page_params = params.require(:page).permit(:title, :body, :slug)
    @page.update(page_params)
    redirect_to @page
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_path
  end
  # private method can't be called outside of class
  private
  def page_params
    params.require(:page).permit(:title, :body, :slug)
  end

  
end


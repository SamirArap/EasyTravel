class PagesController < ApplicationController
  
  before_action :find_subject
  #before_action :set_page, :only [:show, :edit, :update, :delete, :destroy] 
  
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    @page_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to(:action => 'index')
    else
      @page_count = Page.count + 1
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)
      redirect_to(:action => 'show', :id => @page.id)
    else
      @page_count = Page.count
      render('edit')
    end  
  end

  def delete
    @page = Page.find(params[:id])
  end

  def desroy
    @page = Page.find(params[:id]).desroy
  end

  private

  def find_subject
    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
    end
  end

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:name, :permalink, :position, :visible)
    
  end
end
class SectionsController < ApplicationController

	before_action :find_page

	def index
		@sections = @page.sections.sorted
		#@sections = Section.all
	end

	def show
		@section = Section.find(params[:id])
	end

	def new
		@section = Section.new({:page_id => @page.id})
    	@pages = Page.order('position ASC')
    	@section_count = Section.count + 1
    	@categories = Category.all
	end

	def create
	    @section = Section.new(section_params)

	    if @section.save
	      redirect_to(:action => 'index', :page_id => @page.id)
	    else
	      @pages = Page.order('position ASC')
	      @section_count = Section.count + 1
	      @categories = Category.all
	      render('new')
	    end
	  end

	def edit
		@section = Section.find(params[:id])
		@pages = Page.order('position ASC')
		@section_count = Section.count
		@categories = Category.all
	end

	def update
		@section = Section.find(params[:id])

		if @section.update_attributes(section_params)
			redirect_to(:action => 'index', :id => @section.id, :page_id => @page.id)
		else
			@pages = Page.order('position ASC')
			@section_count = Section.count
			@categories = Category.all
			render('edit')
		end
	end

	def delete
		@section = Section.find(params[:id])		
	end

	def destroy
		@section = Section.find(params[:id]).destroy
		redirect_to(:action => 'index', :page_id => @page.id)
	end

	private
	def find_page
		if params[:page_id]
			@page = Page.find(params[:page_id])
		end	 
	end

	def section_params
		params.require(:section).permit(:page_id, :position, :permalink, :name, :departure, :return, :price, :trip, :tip, :visible)
	end
end


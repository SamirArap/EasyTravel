class CategoryController < ApplicationController
  
  def index
  	@categories = Category.all
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)

  	if @category.save
  		redirect_to(:action => 'index')
  	else
  		render('new')
  	end
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def update
  	@category = Category.find(params[:id])

  	if @category.update_attributes(category_params)
  		redirect_to(:action => 'index')
  	else
  		render('edit')
  	end  	
  end

  def delete
  	@category = Category.find(params[:id])
  end

  def destroy
  	@category = Category.find(params[:id]).destroy
  	redirect_to(:action => 'index')
  end

  private

  def category_params
  	params.require(:category).permit(:name)
  end
end

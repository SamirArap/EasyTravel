class SubjectsController < ApplicationController

	def index
		@subjects = Subject.all
	end

	def show
		@subject = Subject.find(params[:id])
	end

	def new
		@subject = current_user.post.build
	end

	def create
		@subject = current_user.post.build(subject_params)

		if @subject.save
			redirect_to(:action => 'index')
		else
			render('new')
		end
	end

	def edit
		@subject = Subject.find(params[:id])
	end

	def update
		@subject = Subject.find(params[:id])

		if @subject.update_attributes(subject_params)
			redirect_to(:action => 'show', :id => @subject.id)
		else
			render('edit')
		end
	end

	def delete
		@subject = Subject.find(params[:id])
	end

	def destroy
		@subject = Subject.find(params[:id]).destroy
		redirect_to(:action => 'index')
	
	end

	private

	def subject_params
		params.require(:subject).permit(:name, :logo, :visible)
	end


end
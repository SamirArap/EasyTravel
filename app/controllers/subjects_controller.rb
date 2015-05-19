class SubjectsController < ApplicationController

	before_action :set_subject, only: [:show, :edit, :update, :delete, :destroy]

	def index
		@subjects = Subject.all
	end

	def show
	end

	def new
		@subject = current_user.subjects.build

	end

	def create
		@subject = current_user.subjects.build(subject_params)
		
		if @subject.save
			redirect_to(:action => 'index')
		else
			render('new')
		end
	end

	def edit
	end

	def update

		if @subject.update_attributes(subject_params)
			redirect_to(:action => 'show', :id => @subject.id)
		else
			render('edit')
		end
	end

	def delete
	end

	def destroy
		@subject.destroy
		redirect_to(:action => 'index')
	end

	private

	def set_subject
		@subject = Subject.find(params[:id])
	end

	def subject_params
		params.require(:subject).permit(:name, :logo, :visible)
	end


end
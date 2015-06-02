class PublicController < ApplicationController

	def index
		@subjects = Subject.all
		@pages 	  = Page.all
		@sections = Section.all
	end
end

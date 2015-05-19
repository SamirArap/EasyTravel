class Page < ActiveRecord::Base

	belongs_to :subject

	scope :visible,    lambda { where(:visible => true)}
	scope :invisible,  lambda { where(:visible => false)}
	scope :sorted,     lambda { order("pages.position ASC")}
	
end
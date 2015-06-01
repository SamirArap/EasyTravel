class Section < ActiveRecord::Base

	belongs_to :page
	has_many :category
	

	scope :visible, lambda { where(:visible => true)}
	scope :invisible, lambda { where(:visible => false)}

	scope :sorted, lambda { order("sections.position ASC")}
end

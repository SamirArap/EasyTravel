class Page < ActiveRecord::Base

	belongs_to :subject
	has_many :sections

	scope :visible,    lambda { where(:visible => true)}
	scope :invisible,  lambda { where(:visible => false)}
	scope :sorted,     lambda { order("pages.position ASC")}
	

	validates :name, :presence => true,
					 :length => {:maximum => 50}
	validates :permalink, :presence => true
end

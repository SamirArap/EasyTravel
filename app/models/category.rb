class Category < ActiveRecord::Base

	belongs_to :section

	scope :visible, lambda { where(:visible => true) }
  	scope :invisible, lambda { where(:visible => false) }
end

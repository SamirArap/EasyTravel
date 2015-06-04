class Section < ActiveRecord::Base

	belongs_to :page
	has_many :category
	

	scope :visible, lambda { where(:visible => true)}
	scope :invisible, lambda { where(:visible => false)}

	scope :sorted, lambda { order("sections.position ASC")}

	validates :name, :presence => true,
					 :length => {:maximum => 50}
    validates :permalink, :presence => true
    validates :departure, :presence => true
    validates :return,    :presence => true
    validates :price,     :presence => true

end

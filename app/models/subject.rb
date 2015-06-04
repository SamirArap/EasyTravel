class Subject < ActiveRecord::Base

	belongs_to :user
	has_many :pages
	
	scope :invisible,  lambda { where(:visible => false)}
	scope :sorted,     lambda { order("subjects.position ASC")}
	scope :news_first, lambda { order("subjects.position DESC")}
	scope :search,  lambda {|query|
		where(["name LIKE ?", "%#{query }%"])}

	validates :name, :presence => true,
					 :length => {:maximum => 50}

	validates :logo, :presence => true

end

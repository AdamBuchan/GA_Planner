class Classroom < ActiveRecord::Base

  attr_accessible :name, :location

  has_many :courses

end
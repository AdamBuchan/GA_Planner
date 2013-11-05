class Classroom < ActiveRecord::Base

  attr_accessible :name, :location

  validates :name, presence: true
  validates :location, presence: true

  has_many :courses

end
class Course < ActiveRecord::Base

  attr_accessible :name, :image, :places, :classroom_id, :start_date, :end_date

  validates :name, presence: true
  validates :places, presence: true, numericality: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  has_many :student_enrolments #, dependent: :destroy
  has_many :instructor_enrolments #, dependent: :destroy
  has_many :students, through: :student_enrolments, class_name: 'User', foreign_key: :user_id
  has_many :instructors, through: :instructor_enrolments, class_name: 'User', foreign_key: :user_id
  belongs_to :classroom

  mount_uploader :image, ImageUploader

end

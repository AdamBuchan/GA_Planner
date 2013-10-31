class User < ActiveRecord::Base

  has_secure_password

  attr_accessible :first_name, :last_name, :email, :address, :gender, :image, :password, :password_confirmation, :level

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :student_enrolments #, dependent: :destroy
  has_many :instructor_enrolments #, dependent: :destroy
  
  has_many :lessons, through: :instructor_enrolments, class_name: 'Course', foreign_key: :course_id
  has_many :courses, through: :student_enrolments

  mount_uploader :image, ImageUploader

end

class User < ActiveRecord::Base

  has_secure_password

  attr_accessible :first_name, :last_name, :email, :address, :gender, :image, :password, :password_confirmation, :level

  has_many :student_enrolments
  has_many :instructor_enrolments
  
  # has_many :courses, through: :student_enrolments # Being overwritten by next line!!
  # has_many :courses, through: :instructor_enrolments
  has_many :lessons, through: :instructor_enrolments, class_name: 'Course', foreign_key: :course_id
  has_many :courses, through: :student_enrolments

end

class Course < ActiveRecord::Base

  attr_accessible :name, :image, :places, :classroom_id, :start_date, :end_date

  has_many :student_enrolments
  has_many :instructor_enrolments
  has_many :students, through: :student_enrolments, class_name: 'User', foreign_key: :user_id
  has_many :instructors, through: :instructor_enrolments, class_name: 'User', foreign_key: :user_id
  belongs_to :classroom

end

class InstructorEnrolment < ActiveRecord::Base

  attr_accessible :user_id, :course_id

  belongs_to :lesson, class_name: 'Course', foreign_key: :course_id
  belongs_to :instructor, class_name: 'User', foreign_key: :user_id
  has_one :classroom, through: :course

end
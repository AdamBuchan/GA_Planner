class StudentEnrolment < ActiveRecord::Base

  attr_accessible :user_id, :course_id

  belongs_to :course
  belongs_to :student, class_name: 'User', foreign_key: :user_id
  has_one :classroom, through: :course

end

class CreateCoursesAndUsersAndClassroomsAndStudentEnrolmentsAndInstructorEnrolments < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :gender
      t.text :image
      t.string :password_digest
      t.string :level
    end

    create_table :courses do |t|
      t.string :name
      t.text :image
      t.integer :places
      t.date :start_date
      t.date :end_date
      t.belongs_to :classroom
    end

    create_table :student_enrolments do |t|
      t.belongs_to :user
      t.belongs_to :course
      t.timestamps
    end

    create_table :instructor_enrolments do |t|
      t.belongs_to :user
      t.belongs_to :course
      t.timestamps
    end

    create_table :classrooms do |t|
      t.string :name
      t.string :location
    end

  end
end

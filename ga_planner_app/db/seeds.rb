User.delete_all
Course.delete_all
Classroom.delete_all
StudentEnrolment.delete_all
InstructorEnrolment.delete_all

user1 = User.create!(first_name: 'David', last_name: 'Smith', email: 'david@smith.com', address: '33 Cucumber Lane, London, SW8 9NL', gender: 'male', password: 'david', password_confirmation: 'david', level: 'admin')
user2 = User.create!(first_name: 'John', last_name: 'Burt', email: 'john@burt.com', address: '25 Edith Road, London, N1 5PZ', gender: 'male', password: 'john', password_confirmation: 'john', level: 'staff')
user3 = User.create!(first_name: 'Emma', last_name: 'Burnham', email: 'emma@burnham.com', address: '19 October Circus, London, W8 5RF', gender: 'female', password: 'emma', password_confirmation: 'emma', level: 'instructor')
user4 = User.create!(first_name: 'Julian', last_name: 'Potter', email: 'julian@potter.com', address: '87 Leath Street, London, NW6 4TF', gender: 'male', password: 'julian', password_confirmation: 'julian', level: 'instructor')
user5 = User.create!(first_name: 'Josephine', last_name: 'Blake', email: 'josephine@blake.com', address: '186 High Road, London, E3 9TL', gender: 'female', password: 'josephine', password_confirmation: 'josephine', level: 'student')
user6 = User.create!(first_name: 'Patricia', last_name: 'Duncan', email: 'patricia@duncan.com', address: '65 Lark Avenue, London, W14 8HT', gender: 'female', password: 'patricia', password_confirmation: 'patricia', level: 'student')
user7 = User.create!(first_name: 'James', last_name: 'Taylor', email: 'james@taylor.com', address: '374 Petersham High Road, London, SE1 4TH', gender: 'male', password: 'james', password_confirmation: 'james', level: 'student')
user8 = User.create!(first_name: 'Patrick', last_name: 'Dober', email: 'patrick@dober.com', address: '186 High Road, London, E3 9TL', gender: 'male', password: 'patrick', password_confirmation: 'patrick', level: 'student')
# requires images

classroom1 = Classroom.create!(name: 'Room1', location: 'London')
classroom2 = Classroom.create!(name: 'Room2', location: 'London')
classroom3 = Classroom.create!(name: 'Room3', location: 'London')

course1 = Course.create!(name: 'Web Develoment Immersive', places: 20, start_date: '15/11/2013', end_date: '15/02/2014', classroom_id: classroom1.id)
course2 = Course.create!(name: 'Front-End Development', places: 15, start_date: '01/11/2013', end_date: '01/12/2013', classroom_id: classroom2.id)
course3 = Course.create!(name: 'Digital Marketing', places: 10, start_date: '01/12/2013', end_date: '15/2/2013', classroom_id: classroom3.id)
course4 = Course.create!(name: 'Product Design', places: 10, start_date: '01/01/2014', end_date: '15/01/2014', classroom_id: classroom2.id)
course5 = Course.create!(name: 'Data Analysis', places: 15, start_date: '01/03/2014', end_date: '01/04/2014', classroom_id: classroom3.id)
# requires images

student_enrolment1 = StudentEnrolment.create!(user_id: user5.id, course_id: course1.id)
student_enrolment2 = StudentEnrolment.create!(user_id: user6.id, course_id: course1.id)
student_enrolment3 = StudentEnrolment.create!(user_id: user7.id, course_id: course1.id)
student_enrolment4 = StudentEnrolment.create!(user_id: user8.id, course_id: course2.id)
student_enrolment5 = StudentEnrolment.create!(user_id: user5.id, course_id: course3.id)
student_enrolment6 = StudentEnrolment.create!(user_id: user6.id, course_id: course4.id)
student_enrolment7 = StudentEnrolment.create!(user_id: user7.id, course_id: course5.id)

instructor_enrolment1 = InstructorEnrolment.create!(user_id: user3.id, course_id: course1.id)
instructor_enrolment2 = InstructorEnrolment.create!(user_id: user4.id, course_id: course1.id)
instructor_enrolment3 = InstructorEnrolment.create!(user_id: user3.id, course_id: course2.id)
instructor_enrolment4 = InstructorEnrolment.create!(user_id: user4.id, course_id: course3.id)
instructor_enrolment5 = InstructorEnrolment.create!(user_id: user3.id, course_id: course4.id)
instructor_enrolment6 = InstructorEnrolment.create!(user_id: user4.id, course_id: course5.id)

# remove variable assignments

class StudentEnrolmentsController < ApplicationController

  authorize_resource

  def create
    course = Course.find(params[:course_id])
    if course.places == 0
      flash[:alert] = 'Cannot make booking - no more places left'
      redirect_to course_path(params[:course_id])
    else
      @student_enrolment = StudentEnrolment.new(user_id: current_user.id, course_id: params[:course_id])
      if @student_enrolment.save
        course.places -= 1
        course.save  
        redirect_to course_path(params[:course_id])
      else
        flash[:alert] = 'Place NOT booked'
      end
    end
  end

  def destroy
    @student_enrolment = StudentEnrolment.where("user_id = ? AND course_id = ?", params[:user_id].to_i, params[:course_id].to_i).first
    @student_enrolment.delete
    course = Course.find(params[:course_id])
    course.places += 1
    course.save 
    redirect_to course_path(params[:course_id])
  end

end

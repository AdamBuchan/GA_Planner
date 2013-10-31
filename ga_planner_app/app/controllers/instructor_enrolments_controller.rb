class InstructorEnrolmentsController < ApplicationController

  authorize_resource

  def create
    @instructor_enrolment = InstructorEnrolment.new(user_id: params[:user_id], course_id: params[:course_id])
    if @instructor_enrolment.save  
      redirect_to course_path(params[:course_id])
    else
      flash[:alert] = 'Place NOT booked'
    end
  end

  def destroy
    @instructor_enrolment = InstructorEnrolment.where("user_id = ? AND course_id = ?", params[:user_id].to_i, params[:course_id].to_i).first
    @instructor_enrolment.delete
    redirect_to course_path(params[:course_id])
  end

end
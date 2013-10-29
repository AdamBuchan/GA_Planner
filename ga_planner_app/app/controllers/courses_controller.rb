class CoursesController < ApplicationController

  load_and_authorize_resource

  def index
    # @courses = Course.all
  end

  def new
    @course = Course.new
    # @course.classroom.id = Classroom.last.id
  end

  def create
    @course = Course.new params[:course]
    if @course.save
      redirect_to root_url, notice: 'Course created'
    else
      flash[:alert] = 'Course NOT created'
      render :new
    end
  end

  def edit
  end

  def update
    # @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      redirect_to root_url, notice: 'Course updated successfully'
    else
      flash[:alert] = 'Course NOT updated'
      render :edit
    end
  end

  def destroy
    # @course = Course.find(params[:id])
    @course.delete
    redirect_to(courses_path)
  end

end

class CoursesController < ApplicationController

  load_and_authorize_resource

  def index
    @courses = Course.order("start_date ASC").all
  end

  def new
    @course = Course.new
  end

  def show
    @new_instructors = User.where("level = ?", 'instructor').all
    @new_students = User.where("level = ?", 'student').all
  end

  def create
    @course = Course.new params[:course]
    bookable = true
    start_date = "#{params[:course]['start_date(1i)']}-#{params[:course]['start_date(2i)']}-#{params[:course]['start_date(3i)']}".to_date
    end_date = "#{params[:course]['end_date(1i)']}-#{params[:course]['end_date(2i)']}-#{params[:course]['end_date(3i)']}".to_date
    room = params[:course][:classroom_id]
    existing_courses = Course.where("classroom_id = ?", room).each do |booking|
      if (start_date - booking.end_date) * (booking.start_date - end_date) >= 0
        bookable = false
        # (@course.start_date > booking.start_date) && (@course.start_date < booking.end_date)
      end
    end
    if start_date > end_date
      bookable = false
    end
    if bookable == true
      @course.save
      redirect_to root_url, notice: 'Course created'
    else
      flash[:alert] = 'Course NOT created'
      render :new
    end
  end

  def edit
  end

  def update
    bookable = true
    start_date = "#{params[:course]['start_date(1i)']}-#{params[:course]['start_date(2i)']}-#{params[:course]['start_date(3i)']}".to_date
    end_date = "#{params[:course]['end_date(1i)']}-#{params[:course]['end_date(2i)']}-#{params[:course]['end_date(3i)']}".to_date
    room = params[:course][:classroom_id]
    existing_courses = Course.where("classroom_id = ? AND id != ?", room, params[:id]).each do |booking|
      if (start_date - booking.end_date) * (booking.start_date - end_date) >= 0
        bookable = false
      end
    end
    if start_date > end_date
      bookable = false
    end
    if bookable == true
      @course.update_attributes(params[:course])
      redirect_to course_path(@course), notice: 'Course updated successfully'
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

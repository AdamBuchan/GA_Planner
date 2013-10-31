class ClassroomsController < ApplicationController

  load_and_authorize_resource

  def index
    @classrooms = Classroom.order("name ASC").all
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new params[:classroom]
    if @classroom.save
      redirect_to classrooms_path, notice: 'Classroom created'
    else
      flash[:alert] = 'Classroom NOT created'
      render :new
    end
  end

  def update
    if @classroom.update_attributes(params[:classroom])
      redirect_to classrooms_path, notice: 'Classroom updated'
    else
      flash[:alert] = 'Classroom NOT updated'
      render :edit
    end
  end

  def destroy
    @classroom.delete
    redirect_to classrooms_path, notice: 'Classroom deleted'
  end

end
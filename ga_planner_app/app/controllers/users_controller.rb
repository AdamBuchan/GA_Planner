class UsersController < ApplicationController

  load_and_authorize_resource

  def index
    # @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      @user.level = 'student'
      @user.save #repetition. refactor
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thank you for signing up'
    else
      render :new
    end
  end

  def edit
  end

  def update
    # @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to root_url, notice: 'User updated successfully'
    else
      flash[:alert] = 'User NOT updated'
      render :edit
    end
  end

  def destroy
    # @user = User.find(params[:id])
    @user.delete
    redirect_to(users_path)
  end

end
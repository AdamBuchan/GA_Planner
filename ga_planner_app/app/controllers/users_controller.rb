class UsersController < ApplicationController

  load_and_authorize_resource

  def index
    @users = User.order("last_name ASC").all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      if @user.level = '' then @user.level = 'student' end
      @user.save #repetition. refactor
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'Thank you for signing up'
    else
      render :new
    end
  end

  def edit
  end

  def update
    # @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user), notice: 'User updated successfully'
    else
      flash[:alert] = 'User NOT updated'
      render :edit
    end
  end

  def destroy
    # @user = User.find(params[:id])
    if @user.delete
      if current_user.id == :user_id then session[:user_id] = nil end
    end
    redirect_to(users_path)
  end

end
class UsersController < ApplicationController

  load_and_authorize_resource

  def index
    if current_user.level == 'student' then redirect_to root_url end
    @users = User.order("last_name ASC").all
  end

  def new
    @user = User.new
  end

  def show
    if current_user.level == 'student'
      if current_user.id != @user.id then redirect_to root_url end
    end
  end

  def create
    @user = User.new params[:user]
    if @user.save
      @user.level = 'student'
      @user.save #repetition. refactor
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'Thank you for signing up'
    else
      render :new
    end
  end

  def edit
    if current_user.level == 'student'
      if current_user.id != @user.id then redirect_to root_url end
    end
  end

  def update
    # @user = User.find(params[:id])
    if current_user.id != @user.id then redirect_to root_url end
    if @user.update_attributes(params[:user])
      @user.level = 'student'
      @user.save
      redirect_to user_path(@user), notice: 'Profile updated successfully'
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

  def admin_new
    @user = User.new
  end

  def admin_create
    @user = User.new params[:user]
    if @user.save
      redirect_to user_path(@user)
    else
      render :admin_new
    end
  end

  def admin_edit
    @user = User.find(params[:id])
    render :admin_edit
  end

  def admin_update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user), notice: 'User updated successfully'
    else
      flash[:alert] = 'User NOT updated'
      render :admin_edit
    end
  end

end
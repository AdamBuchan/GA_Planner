class StudentEnrolmentsController < ApplicationController

  # load_and_authorize_resource :recipe
  # load_and_authorize_resource :quantity, :through => :recipe

  load_and_authorize_resource
  load_and_authorize_resource :user

  def new
    # @recipe = Recipe.find params[:recipe_id]
    # @quantity = Quantity.new
  end

  def create
    # @recipe = Recipe.find(params[:recipe_id])
    @user.courses.create(params[:student_enrolment])
    redirect_to @user
  end

  # def destroy
  #   # @quantity = Quantity.find(params[:id])
  #   @quantity.delete
  #   redirect_to(@recipe)
  # end

end
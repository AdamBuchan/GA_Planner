class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Course
    can :create, User

    if user.level == 'admin'
      can :manage, :all

    elsif user.level == 'staff'
      can :read, :all
      can :create, StudentEnrolment
      can :create, InstructorEnrolment
      can :update, :all
      can :destroy, :all

    elsif user.level == 'instructor'
      can :read, :all
      can :create, StudentEnrolment
      can :update, User
      can :destroy, StudentEnrolment

    elsif user.level == 'student'
      can :read, Course
      can :read, User
      can :create, StudentEnrolment
      can :update, User
      can :destroy, StudentEnrolment

    end
  end
end
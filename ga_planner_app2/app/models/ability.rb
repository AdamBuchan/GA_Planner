class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :admin_new, :admin_create, :admin_edit, :admin_update, :to => :admin

    can :read, Course
    can :create, User

    if user.level == 'admin'
      can :manage, :all

    elsif user.level == 'staff'
      can :read, :all
      can :create, StudentEnrolment
      can :create, InstructorEnrolment
      can :update, :all
      can :destroy, StudentEnrolment
      can :destroy, InstructorEnrolment
      can :admin, User

    elsif user.level == 'instructor'
      can :read, :all
      can :create, StudentEnrolment
      can :update, User
      can :destroy, StudentEnrolment
      can :admin, User

    elsif user.level == 'student'
      can :read, Course
      can :read, User
      can :create, StudentEnrolment
      can :update, User
      can :destroy, StudentEnrolment

    end
  end
end
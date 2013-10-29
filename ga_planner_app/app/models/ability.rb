class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, :all
    # if user.role? :admin
    #   can :manage, :all
    # elsif user.role?(:moderator)
    #   can :read, :all
    #   can :flag, :all
    #   can :flagged, :all
    #   can :create, Recipe
    #   can :update, Recipe do |recipe|
    #     recipe.user == user
    #   end
    #   can :destroy, Recipe do |recipe|
    #     recipe.user == user
    #   end
    #   can :manage, Quantity, :recipe => { :user_id => user.id }
    #   can :manage, User
    # elsif user.role?(:chef)
    #   can :read, :all
    #   can :create, Recipe
    #   can :update, Recipe do |recipe|
    #     recipe.user == user
    #   end
    #   can :destroy, Recipe do |recipe|
    #     recipe.user == user
    #   end
    #   can :manage, Ingredient
    #   can :manage, Quantity
    # else
    #   can :read, :all
    #   if user.role?(:author)
    #     can :create, Recipe
    #     can :update, Recipe do |recipe|
    #       recipe.user == user
    #     end
    #     can :destroy, Recipe do |recipe|
    #       recipe.user == user
    #     end
    #     can :manage, Quantity, :recipe => { :user_id => user.id }
    #   end
    # end
  end
end
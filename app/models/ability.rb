class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new # guest user (not logged in)
      can :read, :all
      if user.is? :admin
        can :manage, :all
      elsif user.is? :user
        can :manage, Post, user_id: user.id
        can :manage, Comment, user_id: user.id
      end
  end
end

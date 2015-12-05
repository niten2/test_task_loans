class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user

    if user
      user.admin? ? admin_abilities : manager_abilities
    else
      guest_abilities
    end
  end

  def guest_abilities
    can :read, :all
  end

  def admin_abilities
    can :manage, :all
  end

  def manager_abilities
    # can :create, [Client]
    can :read, [Client]
    can :create, [Client]
    can :mark_removal, [Client]
    can :update, [Client]
    # can :destroy, [Session]
    # cannot :delete [Client]
  end
end

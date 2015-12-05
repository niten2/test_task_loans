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
    # can :read, :all
  end

  def admin_abilities
    can :manage, :all
  end

  def manager_abilities
    # can :create, [Client]
    can :read, [Client, Loan]
    can :read, [User], user: user
    can :update, [User], user: user
    cannot :update, [Loan]
    can :create, [Loan]
    can :issue_loan, [Client]
    can :create, [Client]
    can :mark_removal, [Client]
    can :update, [Client]
    # can :read, [Loan]
    # can :destroy, [Session]
    # cannot :delete [Client]
  end
end

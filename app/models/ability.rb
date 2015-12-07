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
  end

  def admin_abilities
    can :manage, :all
  end

  def manager_abilities
    can :read, [Client, Loan]
    can :read, User, id: user.id

    can :create, [Loan, Client]

    can :issue_loan, [Client]
    can :mark_removal, [Client]

    can :update, [User], id: user.id
    can :update, [Client]
    cannot :update, [Loan]
    cannot :index, [User]
  end
end

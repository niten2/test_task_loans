require 'rails_helper'

describe Ability do
  subject(:ability) { Ability.new(user) }

  describe 'for admin' do
    let(:user) { create :user, admin: true }

    it { should be_able_to :manage, :all }
  end

  describe 'for user' do
    let(:user) { create :user }
    let(:other) { create :user }

    it { should be_able_to :read, Client, Loan}
    it { should be_able_to :read, User, user: user}

    it { should be_able_to :create, Client }
    it { should be_able_to :create, Loan }

    it { should be_able_to :issue_loan, Client }
    it { should be_able_to :mark_removal, Client }

    it { should be_able_to :update, Client }
    it { should be_able_to :update, User, user: user }

    it { should be_able_to :update, Loan }
  end
end

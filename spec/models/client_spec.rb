require 'rails_helper'

describe Client do

  it { should have_many :loans }
  it { should belong_to :user }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:surname) }
  it { should validate_presence_of(:patronymic) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:passport) }

  let!(:client) { create(:client) }
  let!(:loan1) { create(:loan, client: client) }
  let!(:loan2) { create(:loan, client: client) }

  it "#mark_removal?" do
    expect(client.mark_removal).to eq true
  end

  it "#all_loans_cash" do
    expect(client.all_loans_cash).to eq 400
  end


end

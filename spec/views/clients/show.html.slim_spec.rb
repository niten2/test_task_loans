require 'rails_helper'

RSpec.describe "clients/show", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

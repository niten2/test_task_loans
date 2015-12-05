require 'rails_helper'

describe ClientsController do

  let(:user) { create :user }
  let(:client) { create :client, user: user }
  before { sign_in(user) }
  before {request.env["HTTP_REFERER"] = "where_i_came_from"}

  describe "get mark_removal" do
    it "mark_removal return true" do
      get :mark_removal, id: client, user_id: user
        expect(assigns(:client).mark_removal).to be_truthy
    end
  end



end

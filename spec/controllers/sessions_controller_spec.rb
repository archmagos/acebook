require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET /" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /" do
    it "should render login page again if login is invlid" do
      post :new, :params => {:email => "invalid", :password => "invalid"}
      assert_template :new
    end
  end

end

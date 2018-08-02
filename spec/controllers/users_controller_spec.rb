require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = User.create(name:"test2",
                        email: "test2@test.com",
                        password: "password",
                        password_confirmation: "password")
  end

  describe "GET #show" do
    it "shows user profile" do
      get :show, :params => {:id => @user.id}
      assert_template :show
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "redirects to user page if submission valid" do
      post :create, :params => {:user => {:name => "Layth", :email => "email@yahoo.com",
                    :password => "password", :password_confirmation => "password"}}
      # expect(response).to have_http_status(:success)
      expect(response).to have_http_status(302)
      # assert_template :show
      # expect(response).to redirect_to :show
    end

    it "redirects to signup form if submission invalid" do
      post :create, :params => {:user => {:name => "Layth", :email => "invalid_email",
                    :password => "password", :password_confirmation => "password"}}

      assert_template :new
    end
  end
end

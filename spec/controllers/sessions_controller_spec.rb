require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe 'GET /' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /' do
    it 'should render login page again if login is invalid' do
      post :create, params: {
        session: { email: 'invalid@email.com', password: 'invalid' }
      }
      assert_template :new
    end

    it 'should render the user page if login is valid' do
      # id = User.create(
      #   name: 'John', email: 'john@gmail.com', password: 'strongpassword',
      #   password_confirmation: 'strongpassword'
      # ).id
      # post :create, params: {
      #   session: { email: 'john@gmail.com', password: 'strongpassword' }
      # }
      # expect(response).to redirect_to(user_url(id))
    end
  end

  describe 'DELETE /' do
    it 'should logout and display login page' do
      # id = User.create(
      #   name: 'John', email: 'john@gmail.com', password: 'strongpassword',
      #   password_confirmation: 'strongpassword'
      # ).id
      # post :create, params: {
      #   session: { email: 'john@gmail.com', password: 'strongpassword' }
      # }
      # delete :destroy
      # expect(response).to redirect_to(login_url)
    end
  end
end

require 'rails_helper'
require 'json_helper'

RSpec.describe SessionsController, type: :controller do
  before(:each) do
    User.create(
      id: 1, name: 'John', email: 'john@gmail.com', password: 'strongpassword',
      password_confirmation: 'strongpassword'
    )
    post :create, params: { email: 'john@gmail.com',
                            password: 'strongpassword' }
  end

  describe 'POST #create' do
    it 'should authenticate the user and return a JSON confirmation' do
      post :create, params: { email: 'john@gmail.com',
                              password: 'strongpassword' }
      expect(parsed_response_body['user_id']).to eq(1)
    end

    it 'should not authenticate and return a JSON rejection' do
      post :create, params: { email: 'john@gmail.com',
                              password: 'wrongpassword' }
      expect(parsed_response_body['logged_in']).to eq('false')
    end
  end

  describe 'DELETE #destroy' do
    it 'should return JSON confirmation ' do
      delete :destroy, params: { user_id: 1 }
      expect(Session.all.empty?).to eq true
    end
  end
end

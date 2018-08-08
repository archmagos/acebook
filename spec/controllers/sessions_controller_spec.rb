require 'rails_helper'
require 'json_helper'

RSpec.describe SessionsController, type: :controller do
  before(:each) do
    User.create(
      name: 'John', email: 'john@gmail.com', password: 'strongpassword',
      password_confirmation: 'strongpassword'
    )

  end

  describe 'POST #create' do
    it 'should authenticate the user and return a JSON confirmation' do
      post :create, params: { email: 'john@gmail.com',
                              password: 'strongpassword' }
      expect(parsed_response_body['logged_in']).to eq('true')
    end

    it 'should not authenticate and return a JSON rejection' do
      post :create, params: { email: 'john@gmail.com',
                              password: 'wrongpassword' }
      expect(parsed_response_body['logged_in']).to eq('false')
    end
  end

  describe 'DELETE #destroy' do
    it 'should return JSON confirmation ' do
      delete :destroy, params: { email: 'john@gmail.com' }
      expect(parsed_response_body['logged_in']).to eq('false')
    end
  end
end

require 'rails_helper'
require 'json_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = User.create(name: 'test2',
                        email: 'test2@test.com',
                        password: 'password',
                        password_confirmation: 'password')
  end

  describe 'POST #create' do
    it 'returns updated JSON if submission valid' do
      post :create, params: { user: { name: 'Layth',
                              email: 'email@yahoo.com',
                              password: 'password',
                              password_confirmation: 'password' } }
      expect(parsed_response_body['name']).to eq('Layth')
    end

    it 'returns error message as JSON if parameters are correct but values invalid' do
      post :create, params: { user: { name: 'Layth',
                                      email: 'invalid_email',
                                      password: 'password',
                                      password_confirmation: 'password' } }
      expect(parsed_response_body['type']).to eq('error')
      expect(parsed_response_body['message']).to eq('Invalid Submission')
    end
  end

  describe 'GET #all' do
    it 'returns a JSON' do
      get :all
      expect(response.content_type).to eq('application/json')
    end

    it 'returns all users' do
      get :all
      expect(parsed_response_body.last['name']).to eq('test2')
    end
  end
end

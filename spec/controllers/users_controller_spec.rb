require 'rails_helper'

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
      @response = JSON.parse(response.body)
      expect(@response['name']).to eq('Layth')
    end

    it 'returns error message as JSON' do
      post :create, params: { user: { name: 'Layth',
                                      email: 'invalid_email',
                                      password: 'password',
                                      password_confirmation: 'password' } }
      p response
      @response = JSON.parse(response.body)
      expect(@response['type']).to eq('error')
      expect(@response['message']).to eq('invalid submission')
    end
  end

  describe 'GET #all' do
    it 'returns a JSON' do
      get :all
      expect(response.content_type).to eq('application/json')
    end

    it 'returns all users' do
      get :all
      @response = JSON.parse(response.body)
      expect(@response['name']).to eq('test2')
    end
  end
end

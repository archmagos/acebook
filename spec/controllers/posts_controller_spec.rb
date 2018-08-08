require 'rails_helper'
require 'json_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    User.create(id: '1',
                name: 'test2',
                email: 'test2@test.com',
                password: 'password',
                password_confirmation: 'password')
    Post.create( message: 'Makers', user_id: 1 )
  end

  describe "GET #index" do
    it "returns a list of all posts" do
      get :index
      expect(parsed_response_body.last['message']).to eq('Makers')
    end
  end

  describe "POST #create" do
    it "creates a new post" do
      post :create, params: { post: { message: "Hello, world!", user_id: 1 } }
      expect(parsed_response_body['message']).to eq('Hello, world!')
    end
  end

  describe ' ' do
    it ' ' do
      get :test
      p parsed_response_body
    end
  end
end

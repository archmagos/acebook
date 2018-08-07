require 'rails_helper'
require 'log_in_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    create_user
    log_in
    @post = Post.create( message: 'Makers' )
  end

  describe "GET #index" do
    it "returns a list of all posts" do
      get :index
      @response = JSON.parse(response.body)
      expect(@response.last['message']).to eq('Makers')
    end
  end

  describe "POST #create" do
    it "creates a new post" do
      post :create, params: { post: { message: "Hello, world!" } }
      @response = JSON.parse(response.body)
      expect(@response['message']).to eq('Hello, world!')
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end

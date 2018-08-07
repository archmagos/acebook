require 'rails_helper'
require 'log_in_helper'
require 'json_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    create_user
    log_in
    @post = Post.create( message: 'Makers' )
  end

  describe "GET #index" do
    it "returns a list of all posts" do
      get :index
      expect(parsed_response_body.last['message']).to eq('Makers')
    end
  end

  describe "POST #create" do
    it "creates a new post" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(parsed_response_body['message']).to eq('Hello, world!')
    end
  end
end

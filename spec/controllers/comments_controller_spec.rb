require 'rails_helper'
require 'json_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    # create_user
    # log_in
    @user_id = User.create(
      name: 'test2',
      email: 'test2@test.com',
      password: 'password',
      password_confirmation: 'password'
    )['id']
    @post_id = Post.create({message: "Hello, world!", user_id: @user_id})['id']
    Comment.create( {body: "Hi", post_id: @post_id, user_id: @user_id})
  end

  describe 'GET #all' do
    it 'returns a JSON of all comments for a post' do
      get :all, params: { post_id: @post_id }
      p parsed_response_body
      expect(parsed_response_body.last['body']).to eq('Hi')
    end
  end

  describe "POST #create" do
    it "returns an updated JSON of all comments for a post" do
      post :create, params: { comment: {
        body: "Hello, Sun!",
        user_id: @user_id,
        post_id: @post_id
      } }
      expect(parsed_response_body.last['body']).to eq('Hello, Sun!')
    end
  end
end

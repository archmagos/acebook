require 'rails_helper'
require 'json_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    # create_user
    # log_in
    Post.create({message: "Hello, world!", id: 1})
    User.create(name: 'test2',
                email: 'test2@test.com',
                password: 'password',
                password_confirmation: 'password')
    Comment.create( {body: "Hi", post_id: 1})
  end

  describe 'GET #all' do
    it 'returns a JSON of all comments for a post' do
      get :all, params: { post_id: 1 }
      expect(parsed_response_body.last['body']).to eq('Hi')
    end
  end

  describe "POST #create" do
    it "returns an updated JSON of all comments for a post" do
      post :create, params: { comment: { body: "Hello, Sun!",
                                          user_id: "#{User.all[0].id}",
                                          post_id: 1} }
      expect(parsed_response_body.last['body']).to eq('Hello, Sun!')
    end
  end
end

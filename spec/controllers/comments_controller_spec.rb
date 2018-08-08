require 'rails_helper'
require 'log_in_helper'
require 'json_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    create_user
    log_in
    Post.create({message: "Hello, world!", id: 1})
  end

  describe 'GET #all' do
    it 'returns a JSON of all comments for a post' do
      Comment.create( {body: "Hi", post_id: 1})
      get :all, params: { post_id: 1 }
      # @response = jsonify
      expect(parsed_response_body['body']).to eq('Hi')
    end
  end

  describe "POST #all" do
    it "returns an updated JSON of all comments for a post" do
      post :create, params: { comment: { body: "Hello, Sun!" }, post_id: 1}
      # @response = jsonify
      expect(parsed_response_body['body']).to eq('Hello, Sun!')
    end
  end
end

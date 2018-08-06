require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    create_user
    log_in
  end
  describe "POST /" do
    it "responds with 200" do
      Post.create({message: "Hello, world!", id: 1})
      post :create, params: { comment: {body: "Hello, world!"}, post_id: 1}
      expect(response).to redirect_to(posts_url)
    end
  end
end

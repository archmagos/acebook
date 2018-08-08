require 'rails_helper'
require 'json_helper'

RSpec.describe LikesController, type: :controller do
  before(:each) do
    User.create(name: 'Fred', email: 'fred@email.com', password: 'password')
    User.create(name: 'Layth', email: 'email@email.com', password: 'password')
    Post.create(message: 'test message')
  end

  describe "POST #create" do
    it "updates and returns the total of likes for a post" do
      post :create, params: { likes: { user_id: "#{User.all[0].id}",
                                       post_id: "#{Post.all[0].id}" } }
      post :create, params: { likes: { user_id: "#{User.all[1].id}",
                                      post_id: "#{Post.all[0].id}" } }
      expect(parsed_response_body.length).to eq(2)
    end

    it "throws an error if foreign key user_id does not exist (back-end)" do
      expect { post :create, :params => {:likes => {:user_id => 5, :post_id => 1}} }.to raise_error(ActiveRecord::InvalidForeignKey)
    end

    it "throws an error if foreign key post_id does not exist (back-end)" do
      expect { post :create, :params => {:likes => {:user_id => 1, :post_id => 5}} }.to raise_error(ActiveRecord::InvalidForeignKey)
    end

    it "prevents a user from adding likes more than once" do
      2.times { post :create, :params => {:likes => {:user_id => "#{User.all[0].id}", :post_id => "#{Post.all[0].id}"}} }
      expect(Like.select('id').where(post_id: "#{Post.all[0].id}", user_id: "#{User.all[0].id}").length).to eq 1
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      Like.create(user_id: "#{User.all[0].id}", post_id: "#{Post.all[0].id}")
      Like.create(user_id: "#{User.all[1].id}", post_id: "#{Post.all[0].id}")
      @likeid = Like.select('id').where(user_id: "#{User.all[0].id}", post_id: "#{Post.all[0].id}").first.id
    end

    it "deletes a like from the database and returns an updated Likes array" do
      delete :destroy, :params => {:id => @likeid, :post_id => "#{Post.all[0].id}"}
      expect(parsed_response_body.length).to eq(1)
    end
  end
end

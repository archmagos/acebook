require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before(:each) do
    User.create(name: 'Fred', email: 'fred@email.com', password: 'password')
    Post.create(message: 'test message')
  end

  describe "POST #create" do
    it "creates a new like in the database" do
      post :create, :params => {:like => {:user_id => "#{User.all[0].id}", :post_id => "#{Post.all[0].id}"}}
      expect(response).to have_http_status(:success)
    end

    it "throws an error if foreign key user_id does not exist (back-end)" do
      expect { post :create, :params => {:like => {:user_id => 5, :post_id => 1}} }.to raise_error(ActiveRecord::InvalidForeignKey)
    end

    it "throws an error if foreign key post_id does not exist (back-end)" do
      expect { post :create, :params => {:like => {:user_id => 1, :post_id => 5}} }.to raise_error(ActiveRecord::InvalidForeignKey)
    end

    it "prevents a user from adding likes more than once" do
      2.times { post :create, :params => {:like => {:user_id => "#{User.all[0].id}", :post_id => "#{Post.all[0].id}"}} }
      expect(Like.select('id').where(post_id: "#{Post.all[0].id}", user_id: "#{User.all[0].id}").length).to eq 1
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      Like.create(user_id: "#{User.all[0].id}", post_id: "#{Post.all[0].id}")
      @likeid = Like.select('id').where(user_id: "#{User.all[0].id}", post_id: "#{Post.all[0].id}").first.id
    end
    it "deletes a like from the database" do
      expect { delete :destroy, :params => {:id => @likeid} }.to change(Like, :count).by(-1)
    end
  end
end

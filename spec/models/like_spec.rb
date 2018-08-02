require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    User.create(name: 'Fred', email: 'fred@email.com', password: 'password')
    Post.create(message: 'test message')
    @userid = User.all[0].id
    @postid = Post.all[0].id
  end

  describe 'like validation' do
    it 'returns true if user/post like combination already exists in database' do
      Like.create(user_id: @userid, post_id: @postid)
      expect(Like.exists?(user_id: @userid, post_id: @postid)).to eq true
    end
    it 'returns false if user/post like combination does not exist in database' do
      expect(Like.exists?(user_id: @userid + 1, post_id: @postid + 1)).to eq false
    end
  end
end

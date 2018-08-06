# frozen_string_literal: true

# No comment
class Post < ApplicationRecord
  has_many :comments

  def poster_name
    User.find(user_id).name if user_id
  end

  def like_id(postid, userid)
    Like.select('id').where(post_id: postid, user_id: userid).first&.id
  end
end

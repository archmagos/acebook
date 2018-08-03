# frozen_string_literal: true

# No comment
class Post < ApplicationRecord
  def poster_name
    User.find(user_id).name if user_id
  end

  def like_id(post_id)
    Like.select('id').where(post_id: post_id, user_id: 1).first&.id
  end
end

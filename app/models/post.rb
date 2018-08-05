# frozen_string_literal: true

# No comment
class Post < ApplicationRecord
  has_many :comments

  def poster_name
    User.find(user_id).name if user_id
  end
end

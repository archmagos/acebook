# frozen_string_literal: true

# No comment
class Post < ApplicationRecord
  def poster_name
    User.find(user_id).name if user_id
  end
end

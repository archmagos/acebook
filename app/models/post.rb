# frozen_string_literal: true

# No comment
class Post < ApplicationRecord
  def poster_name
    if self.user_id
      User.find(self.user_id).name
    end
  end
end

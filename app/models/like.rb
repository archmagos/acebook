# frozen_string_literal: true

# Understands recording likes on a post
class Like < ApplicationRecord
  validates_uniqueness_of :user_id, scope: [:post_id]
end

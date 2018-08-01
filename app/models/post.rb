# frozen_string_literal: true

# No comment
class Post < ApplicationRecord
  has_many :comments
end

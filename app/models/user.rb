# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  VALID_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_REGEX }
  has_secure_password
  validates :password, length: { minimum: 8, maximum: 20 }
end

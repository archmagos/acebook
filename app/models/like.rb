# frozen_string_literal: true

# Understands recording likes on a post
class Like < ApplicationRecord
  validates_uniqueness_of :user_id, scope: [:post_id]

  def retrieve(userid, postid)
    Like.select('id').where(user_id: "#{userid}", post_id: "#{postid}")[0].id
  end
end

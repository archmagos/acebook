# frozen_string_literal: true

# Understands saving and deleting likes
class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)
  end

  # def delete
  #
  # end

  private

  def like_params
    params.require(:like).permit(
      :user_id,
      :post_id
    )
  end
end
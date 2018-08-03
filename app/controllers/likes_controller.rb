# frozen_string_literal: true

# Understands saving and deleting likes
class LikesController < ApplicationController
  def create
    Like.create(like_params)
  end

  def destroy
    Like.delete(params[:id])
  end

  private

  def like_params
    params.permit(
      :post_id
    ).merge(user_id: current_user.id)
  end
end

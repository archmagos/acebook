# frozen_string_literal: true

# Understands saving and deleting likes
class LikesController < ApplicationController
  def create
    Like.create(like_params)
    redirect_to posts_url
  end

  def destroy
    Like.delete(params[:id])
    redirect_to posts_url
  end

  private

  def like_params
    params.require(:likes).permit(
      :user_id,
      :post_id
    )
  end
end

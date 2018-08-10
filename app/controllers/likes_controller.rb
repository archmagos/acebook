# frozen_string_literal: true

# Understands saving and deleting likes
class LikesController < ApplicationController
  def create
    Like.create(like_params)
    all = Like.where(post_id: params[:likes][:post_id])
    render json: all.to_json
  end

  def destroy
    Like.delete(params[:id])
    all = Like.where(post_id: params[:post_id])
    render json: all.to_json
  end

  private

  def like_params
    params.require(:likes).permit(
      :user_id,
      :post_id
    )
  end
end

# frozen_string_literal: true

# Comment Controller
class CommentsController < ApplicationController

  def create
    Comment.create(comment_params)
    all = Comment.where(post_id: params[:comment][:post_id])
    render json: all.to_json
  end

  def all
    all = Comment.where(post_id: params[:post_id])
    render json: all.to_json
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end

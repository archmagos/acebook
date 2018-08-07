# frozen_string_literal: true

# Comment Controller
class CommentsController < ApplicationController

  def create
    @posts = Post.find(params[:post_id])
    @comment = @posts.comments.create(comment_params)
    all = Comment.find_by(post_id: params[:post_id])
    render json: all.to_json
  end

  def all
    all = Comment.find_by(post_id: params[:post_id])
    render json: all.to_json
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end
end

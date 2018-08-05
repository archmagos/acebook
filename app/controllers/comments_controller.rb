# frozen_string_literal: true

# Comment Controller
class CommentsController < ApplicationController
  def create
    @posts = Post.find(params[:post_id])
    @comment = @posts.comments.create(comment_params)
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end
end

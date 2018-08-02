# frozen_string_literal: true
#Comment Class
class CommentsController < ApplicationController
  def create
    @posts = Post.find(params[:post_id])
    @comment = @posts.comments.create(comment_params)
    redirect_to posts_path(@posts)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end


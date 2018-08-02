# frozen_string_literal: true

# No comment
class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
  @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
  @posts = Post.all.order('created_at DESC')
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end
end

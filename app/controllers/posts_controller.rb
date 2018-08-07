# frozen_string_literal: true

# No comment
class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    all = Post.all
    render json: all.last.to_json
  end

  def index
    all = Post.all
    render json: all.to_json
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end
end

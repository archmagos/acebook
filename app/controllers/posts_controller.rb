# frozen_string_literal: true

# No comment
class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new; end

  def create
    @post = Post.create(post_params)
    all = Post.all
    render json: all.last.to_json
  end

  def index
    all = Post.all
    render json: all.to_json
  end

  def test
    render json: {body: 'Success!'}
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end

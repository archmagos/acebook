# frozen_string_literal: true

# No comment
class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new; end

  def create
    @post = Post.create(post_params)
    render json: all_posts_with_user_names.last.to_json
  end

  def index
    render json: all_posts_with_user_names.to_json
  end

  private

  def all_posts_with_user_names
    Post.all.as_json.map do |post|
      user = User.find_by_id(post['user_id'])
      post.merge('user_name' => user['name'])
    end
  end

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end

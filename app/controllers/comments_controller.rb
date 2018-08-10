# frozen_string_literal: true

# Comment Controller
class CommentsController < ApplicationController
  def create
    post_id = Comment.create(comment_params).post_id
    render json: comments_with_user_names(post_id).to_json
  end

  def all
    render json: comments_with_user_names(params[:post_id]).to_json
  end

  private

  def comments_with_user_names(post_id)
    Comment.where(post_id: post_id).as_json.map do |comment|
      user = User.find_by_id(comment['user_id'])
      comment.merge('user_name' => user['name'])
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end

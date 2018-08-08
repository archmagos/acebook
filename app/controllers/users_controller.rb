# frozen_string_literal: true

# No comment
class UsersController < ApplicationController
  def show; end

  def new; end

  def create
    @user = User.create(user_params)
    if @user.save
      all = User.all
      render json: all.last.to_json
    else
      render json: { type: 'error', message: 'Invalid Submission' }
    end
  end

  def all
    all = User.all
    render json: all.to_json
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

end

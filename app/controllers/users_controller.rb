# frozen_string_literal: true

# No comment
class UsersController < ApplicationController
  def show
    @logged_in = logged_in
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # (conventional) user_params returns appropriate initialization hash,
    # as defined in private method below...

    @user = User.new(user_params)
    if @user.save
      log_in @user
      # equivalent to "redirect_to user_url (@user)"
      all = User.all
      render json: all.last.to_json
    else
      render json: {type: 'error', message: 'Invalid Submission'}
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

  def user_params_permitted?
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    ).permitted?
  end
end

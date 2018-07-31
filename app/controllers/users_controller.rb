# frozen_string_literal: true

# No comment
class UsersController < ApplicationController
  def new; end

  def show
    @user = User.find(params[:id])
  end

end

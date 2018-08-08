# frozen_string_literal: true

# The rails controller for handling sessions.
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      render json: { logged_in: 'true' }
    else
      # flash error message telling user to try again...
      render json: { logged_in: 'false' }
    end
  end

  def destroy
    render json: { logged_in: 'false' }
  end
end

# frozen_string_literal: true

# The rails controller for handling sessions.
class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new; end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      new_session = Session.create(user_id: user.id, session_id: SecureRandom.uuid)
      render json: { user_id: user.id, session_id: new_session.session_id }
    else
      # flash error message telling user to try again...
      render json: { logged_in: 'false' }
    end
  end

  def destroy
    Session.where(user_id: params[:user_id]).destroy_all
  end
end

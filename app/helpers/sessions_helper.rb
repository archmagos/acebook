# frozen_string_literal: true

# Helper methods for sessions.
module SessionsHelper
  # def log_in(user)
  #   # uses session method defined by rails - distinct from sessions model.
  #   session[:user_id] = user.id
  # end
  #
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end
  #
  # def logged_in
  #   !current_user.nil?
  # end
  #
  # def log_out
  #   session.delete(:user_id)
  #   @current_user = nil
  # end
end

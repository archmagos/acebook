class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # log_in method pre-defined in SessionsHelper module
      log_in user
      # rails converts user to user_url(user)
      redirect_to user
    else
      # flash error message telling user to try again...
    render 'new'
  end
  end

  def destroy
    log_out
    redirect_to login_url
  end
end

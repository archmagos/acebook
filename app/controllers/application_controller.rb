# frozen_string_literal: true

# No comment
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # - helper module created automatically when the sessions controller
  #   was generated (app/helpers/sessions_helper.rb)
  # - including it in the base class will make the helper available
  #   to all controllers.
  include SessionsHelper
end

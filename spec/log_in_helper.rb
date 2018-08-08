 # frozen_string_literal: true

def create_user
  user_password = '1234567890'
  return if User.find_by(email: 'john@forster.com')
  User.create(
    name: 'John', email: 'john@forster.com',
    password: user_password, password_confirmation: user_password
  )
end

def log_in
  old_controller = @controller
  user_password = '1234567890'
  @controller = SessionsController.new
  post :create, params: {
    session: { email: 'john@forster.com', password: user_password }
  }
  @controller = old_controller
end

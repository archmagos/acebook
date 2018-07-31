require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(
      name: 'John',
      email: 'j_forster@hotmail.co.uk',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  describe 'email address' do
    it 'email validation should accept valid addresses' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid, "#{valid_address.inspect} should be valid"
      end
    end

    it 'email validation should reject invalid addresses' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).to_not be_valid, "#{invalid_address.inspect} should be invalid"
      end
    end
  end
end

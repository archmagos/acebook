require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(
                    name:'John',
                    email: 'j_forster@hotmail.co.uk',
                    password: 'password',
                    password_confirmation: 'password'
                    )
  end

  describe 'email address' do
    it 'should be valid' do
      expect(@user).to be_valid
    end

    it 'should be present' do
      @user.email = '  '
      expect(@user).not_to be_valid
    end

    it 'should not be over 255 characters' do
      @user.email = 'a' * 244 + '@example.com'
      expect(@user).not_to be_valid
    end
  end
end

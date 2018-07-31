require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name:'John', email: 'j_forster@hotmail.co.uk',
    password: 'password', password_confirmation: 'password')
  end

  describe 'name' do
    it 'should be present' do
      @user.name = '         '
      expect(@user).not_to be_valid
    end

    it 'should not be over 50 characters' do
      @user.name = 'a' * 51
      expect(@user).not_to be_valid
    end
  end

  describe 'password' do
    it 'should be present' do
      @user.password = @user.password_confirmation = " " * 6
      expect(@user).to_not be_valid
    end

    it 'should have minimum length of 8' do
      @user.password = @user.password_confirmation = "1234567"
      expect(@user).to_not be_valid
    end

    it 'should have maximum length of 20' do
      @user.password = @user.password_confirmation = "123456789123456789123"
      expect(@user).to_not be_valid
    end
  end
  end

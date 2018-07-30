require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name:'John', email: 'j_forster@hotmail.co.uk')
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

    it 'email validation should accept valid addresses' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
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

    it 'should be unique' do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      expect(duplicate_user).not_to be_valid
    end

    it 'should turn to downcase' do
      upcase_email = 'UPCASE@DOMAIN.COM'
      @user.email = 'UPCASE@DOMAIN.COM'
      @user.save
      @user.reload
      expect(@user.email).to eq(upcase_email.downcase)
    end
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
end

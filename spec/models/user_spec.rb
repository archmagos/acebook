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
  end

  describe 'name' do
    it 'should be present' do
      @user.name = '         '
      expect(@user).not_to be_valid
    end
  end
end

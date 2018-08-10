require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'poster_name' do
    it 'finds the name of the user who posted the comment' do
      user_1 = User.create({ name: "Ben",
                    email: "ben-893@hotmail.com",
                    password: "password",
                    password_confirmation: "password" })
      subject.user_id = user_1.id
      expect(subject.poster_name).to eq "Ben"
    end
  end
end

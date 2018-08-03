require 'rails_helper'
require 'log_in_helper'

RSpec.feature 'Timeline', type: :feature do
  before(:each) do
    create_user
    visit '/login'
    fill_in 'Email', with: 'john@forster.com'
    fill_in 'Password', with: '1234567890'
    click_button 'Log in'
  end

  scenario 'Can submit posts and view them' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end
end

require 'rails_helper'

RSpec.describe 'user', type: :system do
  describe 'user index page' do
    it 'I can see the user username.' do
      visit users_path
      users = User.all
      users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'I can see the user profile picture.' do
      visit users_path
      page.has_selector?('img')
    end

    it 'I can see the number of posts ' do
      visit users_path
      expect(page).to have_content('Number of posts')
    end

    it 'When I click on a user, I am redirected to that users show page' do
      visit users_path
      click_link('Name: Tom')
      expect(page.current_path).to eql('/users/5')
    end
  end
end

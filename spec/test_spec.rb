require 'rails_helper'

RSpec.describe 'Hello world', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit "/"
      sleep(10)
      expect(page).to have_content('Users')
    end
  end
end
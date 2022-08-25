require 'rails_helper'

RSpec.describe 'user', type: :feature do
  describe 'user post index page' do
    before(:each) do
      @user = User.first
      @post = @user.posts.last
    end

    it ' I can see the users profile picture' do
      visit users_path
      first('.user-link').click
      first('.link').click
      expect(page).to have_content(@user.name)
    end

    it 'I can see the users username' do
      visit users_path
      first('.user-link').click
      first('.link').click
      expect(page.find('img')['src']).to have_content(@user.photo)
    end

    it 'I can see the number of posts the user has written' do
      visit users_path
      first('.user-link').click
      first('.link').click
      expect(page).to have_content(@user.post_counter)
    end

    it 'I can see a posts title' do
      visit users_path
      first('.user-link').click
      first('.link').click
      expect(page).to have_content(@post.title)
    end

    it 'I can see some of the posts body' do
      visit users_path
      first('.user-link').click
      first('.link').click
      expect(page).to have_content('Text')
    end

    it 'I can see the first comments on a post' do
      visit user_posts_path(@user)
      expect(page).to have_content('first comment: Hi Tom! I am jane')
    end

    it 'I can see how many comments a post has' do
      visit users_path
      first('.user-link').click
      first('.user').click
      expect(page).to have_content(@post.comment_counter)
    end

    it 'I can see how many likes a post has' do
      visit users_path
      first('.user-link').click
      first('.link').click
      expect(page).to have_content(@post.like_counter)
    end

    it 'When I click on a post, it redirects me to that posts show page' do
      visit users_path
      first('.user-link').click
      first('.link').click
      first('.user').click
      expect(page.current_path).to eql('/users/5/posts/1')
    end
  end
end

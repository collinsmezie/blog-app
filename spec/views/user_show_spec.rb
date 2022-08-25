require 'rails_helper'

RSpec.describe 'user', type: :feature do
  describe 'user show page' do
    before(:each) do
        @user = User.first
      end

      it 'I can see the user username.' do
         visit users_path
         first(".user-link").click      
         expect(page).to have_content(@user.name)
        end
      
      it 'I can see the user profile picture.' do
        visit users_path
        first(".user-link").click
        expect(page.find('img')['src']).to have_content(@user.photo)
    end
      
      it 'I can see the number of posts ' do
        visit users_path
        first(".user-link").click
        expect(page).to have_content(@user.post_counter)
    end

     it 'I can see the users bio ' do
        visit users_path
        first(".user-link").click
        expect(page).to have_content(@user.bio)
    end


     it 'I can see the users last 3 posts' do
        visit users_path
        first(".user-link").click
        user_post = @user.first_three_posts
        user_post.each do |post|
         expect(page).to have_content(post.title)
         expect(page).to have_content(post.text)
        end
    end

     it 'I can see a button to view all posts of a user ' do
        visit users_path
        first(".user-link").click
        expect(page).to have_selector('a')
    end

      it 'When I click a users post, it redirects me to that posts show page' do
        visit users_path
        first(".user-link").click
        first(".user").click
        expect(page.current_path).to eql("/users/5/posts/1")
      end


      it 'When I click to see all posts, it redirects me to the users posts index page.' do
        visit users_path
        first(".user-link").click
        first(".link").click
        expect(page.current_path).to eql("/users/5/posts/")
      end
  end
end

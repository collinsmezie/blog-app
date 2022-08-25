require 'rails_helper'

RSpec.describe 'post', type: :feature do
  describe 'user post show page' do
    before(:each) do
      @user = User.first
      @post = @user.posts.last
      @comment = @post.comments
    end

    it 'I can see the posts title' do
      visit user_post_path(@user, @post)
      expect(page).to have_content(@post.title)
    end

    it 'I can see who wrote the post' do
      visit user_post_path(@user, @post)
      expect(page).to have_content(@post.user.name)
    end

    it 'I can see how many comments it has' do
      visit user_post_path(@user, @post)
      expect(page).to have_content(@post.comment_counter)
    end

    it '# I can see how many likes it has' do
      visit user_post_path(@user, @post)
      expect(page).to have_content(@post.like_counter)
    end

    it '# I can see the post body' do
      visit user_post_path(@user, @post)
      expect(page).to have_content(@post.text)
    end

    it 'I can see the username of each commentor' do
      visit user_post_path(@user, @post)
      @comment.each do |comment|
        expect(page).to have_content(comment.user.name)
      end
    end

    it 'I can see the comment each commentor left' do
      visit user_post_path(@user, @post)
      @comment.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end

class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id', counter_cache: 'post_counter'
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  has_many :likes, foreign_key: 'post_id', dependent: :destroy

  def most_recent_comment
    comments.order('created_at DESC').limit(5)
  end

  def update_post_counter
    user.update(post_counter: user.posts.size)
  end
end

class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id', counter_cache: 'post_counter'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id', counter_cache: 'like_counter'

  def update_like_counter
    post.update(counter_cache: posts.likes.size)
  end
end

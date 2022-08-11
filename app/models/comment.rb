class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id', counter_cache: 'post_counter'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id', counter_cache: 'comment_counter'

  def update_comment_counter
    post.update(comment_counter: post.comments.size)
  end
end

class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id', counter_cache: 'post_counter'
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  has_many :likes, foreign_key: 'post_id', dependent: :destroy

  validates :title, :text, presence: true

  validates_length_of :title, maximum: 250, allow_blank: false

  validates :comment_counter, numericality: { greater_than_or_equal_to: 0 }

  validates :like_counter, numericality: { greater_than_or_equal_to: 0 }

  def most_recent_comment
    comments.order('created_at DESC').limit(5)
  end

  def first_comment
    comments.order('created_at asc').limit(1)
  end

  def update_post_counter
    user.update(post_counter: user.posts.size)
  end
end

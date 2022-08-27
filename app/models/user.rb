class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  validates :name, :photo, :bio, presence: true

  # validates :post_counter, numericality: { greater_than_or_equal_to: 0 }

  def last_three_posts
    posts.order('created_at DESC').limit(3)
  end

  def first_three_posts
    posts.order('created_at asc').limit(3)
  end
end

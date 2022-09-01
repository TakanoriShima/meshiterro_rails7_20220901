class PostImage < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :shop_name, presence: true
  validates :image, presence: true, blob: { content_type: :image }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end

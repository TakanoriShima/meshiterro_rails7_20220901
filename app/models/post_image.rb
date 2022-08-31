class PostImage < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  # ---- 下記1行を追加してください ---- #
  has_many :post_comments, dependent: :destroy
  
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end

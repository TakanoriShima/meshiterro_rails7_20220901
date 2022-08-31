class PostImage < ApplicationRecord
  has_one_attached :image
  # ---- 下記1行を追加してください ---- #
  belongs_to :user
end

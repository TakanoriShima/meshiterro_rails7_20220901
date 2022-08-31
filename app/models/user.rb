class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ---- 下記1行を追加してください ---- #
  has_many :post_images, dependent: :destroy
  
  # ---- 下記1行を追加してください ---- #
  has_many :post_comments, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
end

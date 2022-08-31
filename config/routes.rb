Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  # ---- 下記1行を追加してください ---- #
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
end

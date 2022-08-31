Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  # ---- 下記1行を追加してください ---- #
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  
  # ---- 以下を追加してください ---- #
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end

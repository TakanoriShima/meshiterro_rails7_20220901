Rails.application.routes.draw do

  
  # devise_for :users, controllers: {
  #   registrations: 'users/registrations'
  # }
  devise_for :users
  root to: 'homes#top'
 
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users' => 'devise/registrations#new'
  end
  
  resources :users, only: [:show, :edit, :update]

end

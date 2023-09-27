Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  get 'kids/top' => 'kids#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources:posts do
    resources :likes, only: [:create, :destroy]
  end

  resources :kids do
    resources :favorites, only: [:create, :destroy]
  end
  
  root'kids#top'

end

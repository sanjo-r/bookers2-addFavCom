Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resource :favorites, only: [:create,:destroy]
  end

  resources :users, only: [:show,:index,:edit,:update]
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
end
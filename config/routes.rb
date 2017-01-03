Rails.application.routes.draw do

  devise_for :users

  resources :charges, only: [:new, :create]
  resources :downgrades, only: [:new, :create]
  resources :wikis

  post 'downgrade/create'

  get 'about' => 'welcome#about'
    root 'welcome#index'
end

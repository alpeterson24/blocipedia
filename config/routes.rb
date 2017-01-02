Rails.application.routes.draw do

  devise_for :users

  resources :charges, only: [:new, :create]
  resources :downgrades, only: [:update]
  resources :wikis



  get 'about' => 'welcome#about'
    root 'welcome#index'
end

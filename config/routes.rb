Rails.application.routes.draw do
  devise_for :users

  resources :charges, only: [:new, :create]
  resources :downgrades, only: [:new, :create]
  resources :wikis do
    resources :collaborators, only: [:index, :new, :create]
  end

  post 'downgrade/create'

  get 'about' => 'welcome#about'
    root 'welcome#index'
end

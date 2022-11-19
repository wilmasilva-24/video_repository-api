Rails.application.routes.draw do
  get 'user/index'
  resources :users, only: [:index, :create ]
  resources :videos, only: [:index, :show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

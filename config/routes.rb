Rails.application.routes.draw do
  get 'user/index'
  resources :users, only: :index 
  resources :videos, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

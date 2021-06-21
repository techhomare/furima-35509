Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :messages, only: [:create]
  resources :items do
   resources :orders, only: [:index,:create]
  end
end
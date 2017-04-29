Rails.application.routes.draw do
  devise_for :users
  resources :scores
  resources :chapters
  resources :series
  resources :users
  root 'series#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

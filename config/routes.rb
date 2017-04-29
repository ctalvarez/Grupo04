Rails.application.routes.draw do
  devise_for :users
  get 'series', to: "series#index"
  resources :series
  resources :scores
  resources :chapters
  resources :users
  root 'series#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

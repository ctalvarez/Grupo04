Rails.application.routes.draw do
  devise_for :users
  get 'series', to: "series#index"
  get 'home', to: "series#home"
  resources :series
  resources :scores
  resources :chapters
  resources :users
  root 'series#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

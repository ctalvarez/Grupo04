Rails.application.routes.draw do
  devise_for :users
  get 'series', to: 'series#index'
  get 'home', to: 'series#home'
  resources :series do
    resources :chapters
  end
  resources :scores
  # resources :chapters
  resources :users
  root 'series#home'

  patch 'change_level', to: 'users#change_level'

  get '/user/:id/new_child', to: 'users#new_child', as: :new_child
  post '/user/:id/children', to: 'users#create_child', as: :children
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

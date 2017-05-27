Rails.application.routes.draw do
  devise_for :users
  get 'series', to: 'series#index'
  get 'home', to: 'series#home'
  resources :series do
    resources :sessions do
      resources :chapters
    end
  end
  resources :scores
  #resources :chapters
  resources :users
  root 'series#home'

  patch 'change_level', to: 'users#change_level'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

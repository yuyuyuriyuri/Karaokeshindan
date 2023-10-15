Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "cats/teeze" => "cats#teeze"
  resources :users, only: [:show]
  resources :songs
  resources :cats
  
  root 'songs#top'
end

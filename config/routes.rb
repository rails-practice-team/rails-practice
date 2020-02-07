Rails.application.routes.draw do
  root 'tweets#top'
  resources :tweets
  devise_for :users
  resources :users
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

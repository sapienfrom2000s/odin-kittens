Rails.application.routes.draw do
  get 'photos/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :kittens
  resources :photos, only: [:index] 
  # Defines the root path route ("/")
  root "photos#index"
end

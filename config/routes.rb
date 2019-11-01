Rails.application.routes.draw do
    resources :sessions, only: [:new, :create, :destroy]
    resources :gossips do
      resources :comments
      resources :likes
  end
  resources :conversations do
    resources :messages
   end
  resources :contact
  resources :team
  resources :users
  resources :cities
  
  root to: 'gossips#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

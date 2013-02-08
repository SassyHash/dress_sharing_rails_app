DressSharing::Application.routes.draw do
 resources :users
 resources :dresses
 resources :sessions, only: [:create, :new, :destroy]

  match '/signin', to: 'sessions#new'
  match '/signup', to: 'users#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/aboutus', to: 'pages#about'
  match '/contact', to: 'pages#contact'

  root to: 'sessions#new'

end

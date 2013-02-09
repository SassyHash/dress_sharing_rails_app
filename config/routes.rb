DressSharing::Application.routes.draw do
 resources :users
 resources :dresses do
    member do
      get "photo"
    end
  end
 resources :sessions, only: [:create, :new, :destroy]

  match '/signin', to: 'sessions#new'
  match '/signup', to: 'users#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/aboutus', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

  root to: 'sessions#new'

end

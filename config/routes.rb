Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :products
  get    '/create_dish',   to: 'products#new'
  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
end
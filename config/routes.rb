Dd::Application.routes.draw do
  get "password_resets/new"
  get "password_resets/edit"
  get "sessions/new"
  root 'static_pages#about'

  get 'about'       => 'static_pages#about'
  get 'rules'       => 'static_pages#rules'
  get 'jobs'        => 'static_pages#jobs'
  get 'register'    => 'users#new'
  get    'login'    => 'sessions#new'
  post   'login'    => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'
  
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :users
  resources :posts,          only: [:create, :destroy]
end

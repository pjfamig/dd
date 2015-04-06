Dd::Application.routes.draw do
  root 'static_pages#about'

  get 'about' => 'static_pages#about'
  get 'rules' => 'static_pages#rules'
  get 'jobs' => 'static_pages#jobs'
  get 'register'  => 'users#new'
  
end

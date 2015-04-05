Dd::Application.routes.draw do
  get "static_pages/about"
  get "static_pages/rules"
  root 'static_pages#about'

end

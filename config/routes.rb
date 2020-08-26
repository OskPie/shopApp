Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home', as: :home
  
  get 'login', to: 'auth#new', as: :new_login
  post 'login', to: 'auth#create', as: :login
  delete 'logout', to: 'auth#destroy', as: :logout
  get 'signup', to: 'registrations#new', as: :new_signup
  post 'signup', to: 'registrations#create', as: :signup

  namespace :seller do
    get 'signup', to: 'registrations#new', as: :new_signup
    post 'signup', to: 'registrations#create', as: :signup
  end
end

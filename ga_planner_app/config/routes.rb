GaPlannerApp::Application.routes.draw do

  resources :courses
  resources :users
  resources :student_enrolments, only: [:new, :create, :destroy]

  root to: 'courses#index'

  resources :sessions, only: [:new, :create, :destroy]

  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end

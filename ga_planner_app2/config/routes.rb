GaPlannerApp::Application.routes.draw do

  resources :courses
  resources :users
  resources :student_enrolments, only: [:create, :destroy]
  resources :instructor_enrolments, only: [:create, :destroy]
  resources :classrooms

  root to: 'courses#index'

  resources :sessions, only: [:new, :create, :destroy]

  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/admin_new', to: 'users#admin_new', as: 'admin_new'
  post '/admin_new', to: 'users#admin_create', as: 'admin_create'
  get '/admin_edit/:id', to: 'users#admin_edit', as: 'admin_edit'
  put '/admin_update/:id', to: 'users#admin_update', as: 'admin_update'

end

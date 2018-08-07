Rails.application.routes.draw do
  get 'sessions/new'
  get     '/signup',  to: 'users#new'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  get '/users', to: 'users#all'
  post '/users/new', to: 'users#create'

  get '/posts/', to: 'posts#index'
  post '/posts/new', to: 'posts#create'

  get '/comments', to: 'comments#all'
  post '/comments/new', to: 'comments#create'

  # resources :users, :likes
  # resources :posts do
  #   resources :comments
  # end

  root 'welcome#index'
end

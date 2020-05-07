Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'posts#index'

  get '/new' => 'posts#new'
  get '/create' => 'posts#create'
  # get '/update' => 'posts#update'

  resources :posts
end

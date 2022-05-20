Rails.application.routes.draw do
 
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'users/register', to: 'users#create'
      post 'auth/login', to: 'session#login'
      get 'users/:id', to: 'users#show'
      put 'users/:id', to: 'users#update'
      get 'users', to: 'users#show'
      post 'users/info', to: 'user_infos#create'
      put 'users/info/:id', to: 'user_infos#update'
    end

    namespace :v2 do
      post 'posts/new', to: 'posts#create'
      get 'posts', to: 'posts#index'
      get 'posts/:id', to: 'posts#show'
      put 'posts/:id', to: 'posts#update'
      delete 'posts/:id', to: 'posts#destroy'
    end
  end
end

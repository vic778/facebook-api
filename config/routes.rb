Rails.application.routes.draw do
 
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'users/register', to: 'users#create'
      post 'auth/login', to: 'session#login'
      get 'users/:id', to: 'users#show'
      put 'users/:id', to: 'users#update'
    end
  end
end

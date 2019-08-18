Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do 
      resources :passwords
      resources :logins, only: [:create, :destroy, :edit, :update]
      resources :accounts, only: [:create, :destroy]
      resources :users, only: [:create]

      post '/login', to: 'auth#create'

      get 'users' => 'users#index'
      get 'users/:id' => 'users#show'

      get 'accounts' => 'accounts#index'
      delete 'accounts' => 'accounts#destroy'
      

      post 'logins' => 'logins#create'
      delete 'logins' => 'logins#destroy'

      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
  end
  
end

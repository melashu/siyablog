Rails.application.routes.draw do
  devise_for :users
  
 
  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end

  namespace :api do
    namespace :v1 do
       resources :users do
          resources :posts do
           resources :comments
           resources :likes
        end
  end
    end

  end

  root to: "users#index"
end

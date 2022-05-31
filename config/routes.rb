Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books do
        resources :comments, only: [:create, :destroy]
      end
      resources :categories, only: [:index, :destroy]
    end
  end
end

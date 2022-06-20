Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root to: 'books#index'
  namespace :api do
    namespace :v1, defaults: {format: 'json'} do
      resources :books do
        resources :comments, only: [:index, :destroy, :create, :update]
      end
      resources :categories, only: [:index, :destroy, :create, :update]
    end
  end
end

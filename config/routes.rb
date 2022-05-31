Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :books do
        resources :comments, only: [:create, :destroy, :index]
      end
      resources :categories, only: [:index, :destroy, :create]
    end
  end
end

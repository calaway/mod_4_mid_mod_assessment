Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index, :create, :edit, :update]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:create]
    end
  end
end

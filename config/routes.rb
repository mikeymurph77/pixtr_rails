Rails.application.routes.draw do
  root to:"galleries#index"
  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :users, only: [:create]

  get "/sign_up", to: "users#new"
end

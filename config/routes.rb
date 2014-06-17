Rails.application.routes.draw do
  root to:"galleries#index"
  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create]
  end
end

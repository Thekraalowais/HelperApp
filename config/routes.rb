Rails.application.routes.draw do
  devise_for :users
  resources :services do
    resources :comments
  end
  resources :users
  root "services#index"
end

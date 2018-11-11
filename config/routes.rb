Rails.application.routes.draw do
  devise_for :users
  # root "pages#home"
  resources :services do
    resources :comments
  end
  resources :users
  root "services#index"
end

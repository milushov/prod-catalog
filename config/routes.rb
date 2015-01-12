Rails.application.routes.draw do

  resources :products, only: [:index] do
    resources :reviews
  end

  resources :categories do
    resources :products
  end

  devise_for :users,
    controllers: { registrations: 'registrations' }

  root 'products#index'
end

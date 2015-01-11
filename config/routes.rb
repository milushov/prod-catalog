Rails.application.routes.draw do

  resources :categories do
    resources :products
  end

  devise_for :users

  root 'products#index'
end

Rails.application.routes.draw do

  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  devise_for :users

  root 'products#index'
end

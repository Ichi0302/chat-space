Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, only: [:new, :edit, :create, :update] do
    resources :messages, only: [:index, :create]
  end
  resources :users, only: :index do
    collection do
      get 'search'
    end
  end
end

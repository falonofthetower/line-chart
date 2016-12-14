Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      resources :consumptions, only: [:index, :create, :edit, :update, :show, :destroy]
      root 'consumptions#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :home, only: [:index]
end

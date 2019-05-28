Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
    root 'issues#index', as: :authenticated_root
  end

  root 'public#index'

  resources :issues
  resources :public, only: %i[index]
end

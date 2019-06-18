Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'issues#index', as: :authenticated_root, constraints: RoleConstraint.new(:reporter)
  root 'admin/users#index', as: :admin_root, constraints: RoleConstraint.new(:admin)
  root 'staff/issues#index', as: :staff_root, constraints: RoleConstraint.new(:staff)
  root 'public#index'

  namespace :admin do
    resources :users
  end

  namespace :staff do
    resources :issues, except: %i[show create]
  end

  resources :issues do
    member do
      put 'reopen', to: 'issues#reopen'
    end
  end
  resources :public, only: %i[index]
end

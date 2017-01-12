Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "doramas#new"
  devise_for :admin_users
  resources :doramas
end

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "doramas#new"
  resources :doramas

  root "photos#show"
  resources :tweets
end

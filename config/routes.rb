Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "doramas#new"
  resources :doramas do
    resources :tweets do
    end
  end
end

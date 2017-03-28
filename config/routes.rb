Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "doramas#index"
  resources :doramas do
    resources :tweets do
    end
  end
end

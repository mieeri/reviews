Rails.application.routes.draw do
  devise_for :admin_users
  resources :doramas
end

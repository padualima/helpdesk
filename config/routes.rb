Rails.application.routes.draw do
  namespace :backoffice, path: "/" do
    root 'dashboard#index'
  end
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

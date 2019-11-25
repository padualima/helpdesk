Rails.application.routes.draw do

  namespace :frontoffice do
    resources :orders, except: [:show]
    get 'orders/finished', to: "orders#finished"
    resources :calls do
      patch 'finished'
    end
    root 'dashboard#index'
  end

  namespace :backoffice do
    root 'dashboard#index'
    resources :sectors
    resources :sector_calleds
    resources :users
    resources :admins
  end
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

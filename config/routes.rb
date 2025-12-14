Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "bills#new"
  resources :bills, only: [:new, :create, :show, :index]
  resources :customers, only: [:index]

end


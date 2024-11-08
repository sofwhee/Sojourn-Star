Rails.application.routes.draw do
  resources :chapters
  
  devise_for :admins, skip: :registrations, controllers: { registrations: "registrations" }
  
  as :admin do
    get 'admins/edit', to: 'devise/registrations#edit', as: 'edit_admin_registration'
    patch 'admins', to: 'devise/registrations#update', as: 'admin_registration'
  end

  resources :pages
  # get "/pages/:page_number", to: "pages#show"
  resources :home, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  get "characters", to: "characters#index"
end

Rails.application.routes.draw do
  devise_for :admins, only: :sessions, controllers: { registrations: "registrations" }

  resources :pages
  resources :home, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  unauthenticated do
    root "home#index"
  end

  authenticated :admin do
    root "sessions#new", as: :authenticated_root
  end
end

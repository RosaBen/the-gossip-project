Rails.application.routes.draw do
  devise_for :users

 # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

 # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
 # Can be used by load balancers and uptime monitors to verify that the app is live.
 # get "up" => "rails/health#show", as: :rails_health_check
 # get "/teams", to: "teams#index"



 # get "/login", to: "sessions#new", as: "login"
 # post "/login",  to: "sessions#create"
 # delete "/logout", to: "sessions#destroy", as: "logout"
 get "/welcome", to: "users#welcome", as: "welcome"
get "/static_pages/contact", to: "static_pages#contact", as: "contact"
 get "/static_pages/team", to: "static_pages#team", as: "team"
resources :gossips do
  resources :comments
end
resources :users
resources :cities
  # resources :sessions
  # resources :static_pages, only: [] do
  #   collection do
  #     get :contact
  #     get :team
  #     get :home, as: :home_path
  #   end
  # end








  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "static_pages#home"
end

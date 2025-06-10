Rails.application.routes.draw do
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
   # Can be used by load balancers and uptime monitors to verify that the app is live.
   # get "up" => "rails/health#show", as: :rails_health_check
   # get "/teams", to: "teams#index"
   post "/login",  to: "sessions#create"
   get "/static_pages/contact", to: "static_pages#contact", as: "contact"
   get "/static_pages/team", to: "static_pages#team", as: "team"
   get "/gossips",  to: "gossips#index"

get "/welcome/:first_name/:last_name", to: "users#welcome", as: "welcome_user"
delete "/logout", to: "sessions#destroy"
resources :gossips



  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "sessions#new"
end

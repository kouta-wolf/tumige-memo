Rails.application.routes.draw do
  get "games/index"
  get "up" => "rails/health#show", as: :rails_health_check

  root "top#index"

  resources :users, only: %i[ new create ]
  resource :session, only: %i[ new create destroy ]
  resource :game, only: %i[ show ]
end

Rails.application.routes.draw do
  namespace :user do
    get "dashboards/show"
  end
  get "games/index"
  get "up" => "rails/health#show", as: :rails_health_check

  root "top#index"

  resources :users, only: %i[ new create ]
  resource :session, only: %i[ new create destroy ]

  namespace :user do
    resource :dashboard, only: %i[ show ]
  end
end

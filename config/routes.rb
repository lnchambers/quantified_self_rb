Rails.application.routes.draw do
  root "welcome#index"

  namespace :api do
    namespace :v1 do
      resources :foods
      resources :meals, only: [:index]
    end
  end
end

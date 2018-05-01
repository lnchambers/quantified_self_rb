Rails.application.routes.draw do
  root "welcome#index"

  namespace :api do
    namespace :v1 do
      resources :foods
      resources :meals, only: [:index]
      get '/meals/:id/foods', to: 'meals#show'
    end
  end
end

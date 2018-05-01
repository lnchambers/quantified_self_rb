Rails.application.routes.draw do
  root "welcome#index"

  namespace :api do
    namespace :v1 do
      resources :foods
      resources :meals, only: [:index]
      get '/meals/:id/foods', to: 'meals#show'
      post '/api/v1/meals/:id/foods/:id', to: 'meals#create'
    end
  end
end

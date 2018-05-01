Rails.application.routes.draw do
  root "welcome#index"

  namespace :api do
    namespace :v1 do
      resources :foods
      resources :meals, only: [:index] do
        get 'foods', to: 'meals#show'
        post 'foods/:id', to: 'meals#create'
      end
    end
  end
end

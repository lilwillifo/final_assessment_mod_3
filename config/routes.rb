Rails.application.routes.draw do
  root "welcome#index"

  get '/validation', to: 'validation#show'

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
      end
    end
  end
end

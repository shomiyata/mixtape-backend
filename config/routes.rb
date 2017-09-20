Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'login', to: 'login#create'
      resources :users, only: [:show, :update, :create] do
        resources :mixtapes
      end
    end
  end
end

# :mixtape_grams

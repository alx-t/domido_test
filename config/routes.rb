Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :houses, only: [:index, :show, :create] do
        resources :walls, only: [:index, :show, :create] do
          resources :elements, only: [:index, :show, :create]
        end
      end
    end
  end
end

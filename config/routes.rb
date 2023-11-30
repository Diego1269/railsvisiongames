Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :detalle_venta
      resources :privilegios
      resources :categoria do
        resources :productos, only: [:index]
      end
      resources :productos
          resources :venta
      resources :users
      resources :sessions, only: [:create]
      resources :registration, only: [:create]
      resources :usuarios do
        collection do
          get :find_by_email
          get :find_id_by_email
          get :find_priv_by_email
        end
      end
      delete :logout, to: "sessions#logout"
      get :logged_in, to: "sessions#logged_in"
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end

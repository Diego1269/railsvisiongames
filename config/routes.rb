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
      resources :usuarios do
        collection do
          get :find_by_email
          get :find_id_by_email
          get :find_priv_by_email
        end
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end

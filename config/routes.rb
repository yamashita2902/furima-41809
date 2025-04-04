Rails.application.routes.draw do
  devise_for :users
 
  
  get "up" => "rails/health#show", as: :rails_health_check

   root to: "items#index"
 
  resources :items do
    resources :purchaserecords, only: [:index, :new, :create]
  end
end

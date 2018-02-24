Rails.application.routes.draw do
  namespace :api do
    get 'cnis/findRecepisse/:recep', to: 'cnis#findRecepisse'
  end
  resources :cnis
  root "cnis#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

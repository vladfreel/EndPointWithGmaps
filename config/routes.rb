Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tickets, only: %i[create index show], format: :json
  get 'tickets', to: 'tickets#show'
  root to: 'tickets#index'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :widgets
  get '/my_widgets', to: 'widgets#my_widgets'

  root to: "widgets#index"
end

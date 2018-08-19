Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'landing_page/index'
  root 'landing_page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lists
  resources :cards
end

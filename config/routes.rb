# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  # Jumpstart views
  mount Jumpstart::Engine, at: '/jumpstart'

  # Administrate
  namespace :admin do
    resources :users

    root to: "users#index"
  end

  # User account
  devise_for :users,
             controllers: {
               masquerades: 'jumpstart/masquerades',
               omniauth_callbacks: 'jumpstart/omniauth_callbacks',
               registrations: 'users/registrations',
             }

  scope module: :users do
    resource :password
  end

  # Payments
  resource :card
  resource :subscription do
    patch :resume
  end

  scope controller: :static do
    get :about
    get :terms
    get :privacy
  end

  root to: "static#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

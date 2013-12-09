Carseekers::Application.routes.draw do

  #Devise and DeviseOAuth2 routes
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }

  #Standard Routes
  root 'pages#index'
  resources :users do
    resources :profiles, :only => [:index, :show, :edit, :update]
    resources :ads, :only => [:index, :new, :show, :create, :edit, :update]
  end
end

Carseekers::Application.routes.draw do
  get "profiles/show"
  get "profiles/edit"
  get "profiles/update"
  #Devise and DeviseOAuth2 routes
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }

  #Standard Routes
  root 'pages#index'
  resources :users do
    resources :profiles, :only => [:show, :update, :edit]
  end
end

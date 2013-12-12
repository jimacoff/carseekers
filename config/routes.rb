Carseekers::Application.routes.draw do
  #Devise and DeviseOAuth2 routes
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }

  #Standard Routes
  root 'pages#index'
  post "ads/model_selector", :to => 'ads#model_selector', :as => "model_selector"
  resources :users do
    resources :profiles, :only => [:index, :show, :edit, :update]
    resources :ads
  end
  resources :bids, :only => [:create]
end

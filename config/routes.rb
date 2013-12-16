Carseekers::Application.routes.draw do
  #Devise and DeviseOAuth2 routes
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }

  #Standard Routes
  root 'pages#index'
  get 'ads', :to => 'ads#index', :as => 'all_ads'
  get 'ads/map', :to => 'ads#map', :as => 'ads_map'
  post "ads/model_selector", :to => 'ads#model_selector', :as => "model_selector"
  get 'search', :to => 'searches#index', :as => 'search'
  get 'search/map', :to => 'searches#map', :as => 'search_map'
  resource :messages, :only => [:create, :show, :destroy]
  resources :users do
    resources :profiles, :only => [:index, :show, :edit, :update]
    resources :ads, :only => [:show, :new, :create, :edit, :update, :destroy]
  end
  resources :bids, :only => [:create]
end

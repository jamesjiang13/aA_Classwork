Rails.application.routes.draw do
  resources :subs, except: [:destroy, :create, :index]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :index] do
    resources :subs, only: [:create, :index]
  end

  #show edit update delete are almost never nested

  resource :session, only: [:new, :create, :destroy]
end

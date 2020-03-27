Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
  resources :users, only: [:index, :show, :new, :create, :destroy]
  
  # resources :users, except: [:edit, :update]
  
  # resources :users => index, show, new, create, destroy, edit, update


end

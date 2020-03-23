Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :artworks, except: [:new, :edit, :index] do 
    resources :comments, only: [:index]
  end 

  resources :users, except: [:new, :edit] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index] # why isn't comments nested in users resource
  end

  resources :artwork_shares, only: [:show, :index, :create, :destroy]

  resources :comments, only: [:show, :create, :destroy]

end

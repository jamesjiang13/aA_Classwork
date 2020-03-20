Rails.application.routes.draw do
  # resources :users
#           GET  users#index
#           POST   /users(.:format)                                                                         users#create
#           PATCH  /users/:id(.:format)                                                                     users#update
#           PUT    /users/:id(.:format)                                                                     users#update
#           DELETE /users/:id(.:format)                                                                     users#destroy
          # GET    /users/new(.:format)                                                                     users#new
          # GET    /users/:id/edit(.:format)                                                                users#edit
          # GET    /users/:id(.:format)                                                                     users#show

get '/users', to: 'users#index'
post '/users', to: 'users#create' # to add user info to db
get '/users/new', to: 'users#new', as: 'new_user'  # get empty form
get '/users/:id/edit', to: 'users#edit', as: 'edit_user' # get prepopulated user form
get '/users/:id', to: 'users#show', as: 'user'
patch '/users/:id', to: 'users#update' # updates form to db
put '/users/:id', to: 'users#update'
delete '/users/:id', to: 'users#destroy'

end

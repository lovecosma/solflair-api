Rails.application.routes.draw do

  post '/login',    to: 'sessions#create'
  post '/photos',    to: 'photos#create'
  post '/cart_item_photos',    to: 'cart_item_photos#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in'
  resources :items, only: [:create, :show, :index, :update, :destroy]
  resources :users, only: [:create, :show, :index] do 
        resources :cart_items
end

end

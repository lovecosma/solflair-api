Rails.application.routes.draw do

  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in'
  resources :items, only: [:create, :show, :index]
  resources :users, only: [:create, :show, :index] do 
    resources :carts do 
        resources :cart_items
        # patch '/remove', to: 'carts#remove'
    end 
end

end

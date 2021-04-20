Rails.application.routes.draw do
  
root to: "posts#index"  

devise_for :users
resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] 
resources :comments, only: [:new, :create, :edit, :update, :destroy] 
resources :likings, only: [:new, :create, :destroy]
resources :requests, only: [:index, :create, :destroy]
resources :users, only: [:index, :show, :edit, :update, :destroy] do 
  member do
    get "friends", to: "users#friends"
    get "about", to: "users#about"
    # Clear notif
    get "clear", to: "users#clear"
  end
end


end

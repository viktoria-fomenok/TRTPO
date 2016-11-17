Rails.application.routes.draw do
  devise_for :admins
  resources :orders
  get "users/info" => "users#info"
  devise_for :users, controllers: { sessions: "users/sessions" }
  resources :users


   resources :users do
  	resources :orders
  end


  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

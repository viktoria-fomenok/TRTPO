Rails.application.routes.draw do
  devise_for :admins
  resources :orders
  get "users/info" => "users#info"
  get 'orders/check/:id' => "orders#check", as: :orders_check
  get 'orders/delete/:id' => "orders#delete", as: :orders_delete
  get 'users/professors_list/:id' => "users#professors_list", as: :professors_list
  get 'users/send_data/:id' => 'users#send_data', as: :send_data
  get 'users/:id/line/:professor_id' => "users#line", as: :line
  devise_for :users, controllers: { sessions: "users/sessions" }
  resources :users


   resources :users do
  	resources :orders
  end


  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

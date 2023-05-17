Rails.application.routes.draw do
  root "users#check_login"
  get "/login", to: "users#check_login"
  post "/login", to: "users#login"
  get "/logout", to: "users#logout"
  resources :users, only: [ :index, :new, :create ] do
    resources :bank_details
  end
end

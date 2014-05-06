Museusoaresreis::Application.routes.draw do

  # Authentication
  get "/login" => "admin#login", as: "login"
  get "/logout" => "admin#logout", as: "logout"

  # Administrator
  resources :administrators

  # Events
  resources :events
end

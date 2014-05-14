Museusoaresreis::Application.routes.draw do

  # Authentication
  get "/login" => "admin#login", as: "login"
  get "/logout" => "admin#logout", as: "logout"
  get "/recoverPassword" => "admin#forgotPassword", as: "forgot"
  get "/generatePassword" => "admin#generatePassword"

  # Administrator
  resources :administrators

  # Events
  resources :events

  # Languages
  resources :languages

end

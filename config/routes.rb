Museusoaresreis::Application.routes.draw do

  # Authentication
  get "/login" => "admin#login", as: "login"
  get "/logout" => "admin#logout", as: "logout"
  get "/generatePassword" => "admin#generatePassword"

  # Administrator
  resources :administrators

  # Events
  resources :events
  get "/events/:id/translate" => "events#translate", as: "translate"


  # Languages
  resources :languages

  # Root
  root "media#index"

  #Media
  get "/getDates" => "media#getDates"
  get "/getEvents" => "media#getEvents"
  get "/getImage" => "media#getImage"

end

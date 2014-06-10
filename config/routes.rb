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
  get "/getMissingLangs" => "languages#getMissingLangs"
  get "/changeLang" => "languages#changeLang"

  # Translations
  get "/findTranslation" => "event_translations#findTranslation"
  get "/updateTranslation" => "event_translations#updateTranslation"
  resources :event_translations

  # Root
  root "media#index"

  #Media
  get "/getDates" => "media#getDates"
  get "/getEvents" => "media#getEvents"
  get "/getTranslations" => "media#getTranslations"
  get "/getImage" => "media#getImage"
  get "/getEvent" => "media#getEvent"
  get "/puzzle" => "media#puzzle"
  get "/getEventTranslation" => "media#getTranslationEvent"

end

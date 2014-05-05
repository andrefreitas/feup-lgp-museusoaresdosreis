Museusoaresreis::Application.routes.draw do
  resources :administrator

  root to: "admin#login"

  # Authentication
  get "/login" => "admin#login", as: "login"
  get "/logout" => "admin#logout", as: "logout"

  # Administrators Administration
  get "/admin" => "admin#home", as: "admin"
  get "/admin/addAdmin" => "admin#addAdmin", as: "admin_addAdmin"
  get "/admin/create" => "administrator#create"
  get "/admin/all" => "administrator#index"
  get "/admin/:id" => "administrator#show"
  get "/admin/update/:id" => "administrator#update"
  get "/admin/destroy/:id" => "administrator#destroy"
  get "/admin/listAdmins" => "admin#listAdmins", as: "admin_listAdmins"

  # Events Administration
  get "/addEvent" => "admin#addEvent", as: "admin_addEvent"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

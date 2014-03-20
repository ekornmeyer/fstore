Store::Application.routes.draw do
  get "home/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  resources :customers do
    resources :assets
    resources :shipping_addresses
    resources :billing_addresses
  end

  resources :order_lines

  resources :products
  
  resources :sessions, only: [:new, :create, :destroy]
  match '/register',  to: 'customers#new',            via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/signin',  to: 'sessions#new',         via: 'get'

  match '/shoppingcart', to: 'shopping_cart#show', via: [:get, :post]
  match '/checkout', to: 'checkout#show', via: 'get'
  
  post '/update_quantity', to: 'shopping_cart#update_quantity'
  get "/get_sh_address" => "customers#get_sh_address", as: :shipping_address
  get "/get_bi_address" => "customers#get_bi_address", as: :billing_address
  get '/order_process', to: 'products#order_process'

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
Changayi::Application.routes.draw do
  get "pages/index"

  get "pages/research"

  get "pages/reviews"

  get "pages/about"

  get "pages/help"

  get "pages/terms"

  get "pages/contact"

  get "sessions/new"
  
  resources :vehicles

  resources :users do
	resources :contacts
  end
  
  resources :sessions
  
  match '/signup',  :to => 'users#new'
  match '/buy',  :to => 'vehicles#index'
  match '/sell',  :to => 'vehicles#new'
  match '/login', :to => 'sessions#new'
  match '/research', :to => 'pages#research'
  match '/reviews', :to => 'pages#reviews'
  match '/about', :to => 'pages#about'
  match '/help', :to => 'pages#help'
  match '/terms', :to => 'pages#terms'
  match '/contact', :to => 'pages#contact'
  match '/user/update', :to => 'users#edit'



get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"
get "accounts" => "users#show", :as => "accounts"
get "search" => "vehicles#find", :as => "search"
get "edit_user" => "users#edit", :as => "update"
	
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

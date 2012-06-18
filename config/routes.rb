ProjectX::Application.routes.draw do


  devise_for :users, :controllers => {:registrations => 'registrations'}, :path_prefix => 'd'
  resources :people
  resources :users
  resources :medical_aids
  resources :person_medical_aids
  resources :medical_aid_plans
  resources :wait_lists
  resources :consultations
  resources :diagnoses
  resources :orders
  resources :person_profiles
  resources :profile_types
  resources :profile_sub_types
  resources :profile_sub_items
  resources :profile_items
  resources :dependencies
  resources :consultations
  resources :departments
  resources :department_operations
  resources :vitals
  resources :person_profile_steps
  resources :profile_item_steps
  resources :invoices

  match 'person_profiles/getPSub' => 'person_profiles#getPsub'
  match 'department_operation/get_operation_price' => 'department_operation#get_operation_price'
  match 'invoices/department_operation_price' => 'invoices#department_operation_price'
  ActiveAdmin.routes(self)
  get "home/index"

  get "home/about"
  get "home/admin"

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

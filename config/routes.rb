Project::Application.routes.draw do



  get "home/timkiem"

  get "admin/home/index"
  get 'admin' => 'admin::home#index'
  post 'admin' => 'admin::home#index'
  get 'admin/logout' => 'admin::home#logout'
  get 'timkiem' => 'home#timkiem'
  post 'timkiem' => 'home#timkiem'
  post 'lich_su_binh_baus' => 'lich_su_binh_baus#create'
  post 'nhan_xets' => 'nhan_xets#create'
  post 'nhan_xet_tqs' => 'nhan_xet_tqs#create'
  resources :binh_baus, only: [:index, :show], :id => /.+/
  resources :truongs, only: [:index, :show], :id => /.+/
  resources :tieu_chis, only: [:index, :show], :id => /.+/
  resources :nhan_xets, only: [:show,:created, :update, :destroy]
  resources :nhan_xet_tqs, only: [:created, :update, :destroy]
  resources :users

  namespace :admin do
    resources :binh_baus, except: [:show], :id => /.+/
    resources :truongs, except: [:show], :id => /.+/
    resources :tieu_chis, except: [:show], :id => /.+/
    resources :nhan_xets
    resources :nhan_xet_tqs
    resources :users
  end
  match '*path', :to => 'loi#index'


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

Base::Application.routes.draw do

  get "pages/index"
  get "pages/test"

  resources :photos do
    get :autocomplete_dog_name, :on => :collection
  end


  resources :dogs do
  end

  #mount Ckeditor::Engine => '/ckeditor'
  get "/contacts" => "contacts#show"
  get "/contacts/edit" => "contacts#edit"
  put "/contacts" => "contacts#update"


  resources :banners do
		member do
			get 'disable', :action => 'update', :defaults => { :banner => {:disabled => true} }
			get 'enable', :action => 'update', :defaults => { :banner => {:disabled => false} }
		end
	end


  get "users/recovery"

  resources :articles do
		member do
			get 'unpublish', :action => 'update', :defaults => { :article => {:published => false} }
			get 'publish', :action => 'update', :defaults => { :article => {:published => true} }
		end
    get :autocomplete_dog_name, :on => :collection
	end

	pages = %w[index]
	pages.each do |page|
		match page => 'articles#show', :defaults => {:id => page}
	end

	get 'account' => "users#show"
  resources :users do
		member do
			get 'disable', :action => 'update', :defaults => { :user => {:disabled => true} }
			get 'enable', :action => 'update', :defaults => { :user => {:disabled => false} }
		end
	end

	resources :user_sessions

	get "/login" => "user_sessions#new", :as => :login
	post "/login" => "user_sessions#create"
	
	match "logout" => "user_sessions#destroy"
	match "recovery_passwd" => "users#recovery"
	match "signup" => "users#new", :as => :singup
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
  # root :to => 'articles#show', :id => "index"
   root :to => 'pages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

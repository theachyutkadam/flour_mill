Rails.application.routes.draw do
  resources :items
  resources :payments do
  end

  get 'expenses/index'
  get 'reports/index'
  get 'reports/info'
  get 'reports/owner'
  get 'reports/contact'
  get 'reports/report_customers'
  get 'reports/date_vis_product'
  get 'reports/customer_product'


  resources :products do
    collection do
      get :edit
    end
  end

  resources :operators do
    collection do
      get :confirm_delete
      get :new_product
      post :create_product
      get :record
    end
  end
  resources :customers do
    collection do
      get :confirm_delete
    end
  end

  resources :expenses do
    collection do
      get :index
      post :create_expense
    end

    member do
      get :edit_exp
      patch :update_exp
      get :destroy_exp
    end
  end

  get 'home/index'
  get 'home/show'
  devise_for :users
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

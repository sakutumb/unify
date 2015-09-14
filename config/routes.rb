Rails.application.routes.draw do


  root 'unify#index'

  match '/app/services/save-account' => 'unify_matchmakers#save_account', via: :post
  match '/app/services/view-account' => 'unify_matchmakers#view_account', via: :get


  #Generic services login, register, save_linkedin_profile, get_dim_data
  match '/app/services/:do' => 'unify#services', via: [:get, :post]

  match '/search' => 'unify#search', via: [:get, :post]

  resources :unify_matchmakers


  get '/(:dynamic_route)(/:dynamic_action)(/:action_param)' => 'unify#index'

  #get '/:locale/index' => 'unify#index'

  #scope '(:locale)', locale: /en|en-US|es-US/ do
   # resources :account
  #end

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

Rails.application.routes.draw do

  resources :employees do as_routes end
  resources :flows_payable_under_contracts do as_routes end
  get 'static_pages/home'

  namespace :admin do
    resources :report_relations do as_routes end
    resources :categories do as_routes end
    resources :sources do as_routes end
    resources :authors do as_routes end
    resources :attachments do as_routes end
    resources :reports do
      as_routes
      as_nested_resources :attachments
    end
    resources :stock_exchange_countries do as_routes end
    resources :stock_exchanges do as_routes end
    resources :shareholder_relationships do as_routes end
    resources :multinational_companies do as_routes end
    resources :shareholders do as_routes end
    resources :env_and_social_obligations do as_routes end
    resources :tax_obligations do as_routes end
    resources :production_exports do as_routes end
    resources :congolese_companies do as_routes end
  end
  root 'admin/congolese_companies#index'

  # initial route for #home; probably will need to change root to this
  get '/home', to: 'static_pages#home'

  resources :congolese_companies, only: [:show, :index]
  resources :reports, only: [:show, :index]

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

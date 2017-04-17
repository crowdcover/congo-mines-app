Rails.application.routes.draw do

  get 'static_pages/home'
  
  namespace :admin do
    resources :deposit_sources do as_routes end
    resources :mineral_resources do as_routes end
    resources :deposit_resources do as_routes end
    resources :pages do as_routes end
    resources :social_projects do as_routes end
    resources :processing_infrastructures do as_routes end
    resources :deposits do as_routes end

    resources :employees do as_routes end
    resources :flows_payable_under_contracts do as_routes end
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

    resources :shareholders do as_routes end
    resources :shareholder_relationships do as_routes end
    resources :intermediary_companies do as_routes end
    resources :shareholder_intermediaries do as_routes end

    resources :env_and_social_obligations do as_routes end
    resources :tax_obligations do as_routes end
    resources :production_exports do as_routes end
    resources :drc_companies do as_routes end
  end

  #root 'admin/drc_companies#index'
  root 'static_pages#home'

  get '/home', to: 'static_pages#home'
  get '/admin', to: redirect('admin/drc_companies')
  get '/about', to: 'static_pages#about'

  resources :drc_companies, only: [:show, :index] do  #, only: [:show, :index]
    member do
      get 'get_geodata'
      get 'get_deposits_geodata'
      get 'get_processing_infrastructures_geodata'
      get 'get_social_projects_geodata'
    end
  end
  resources :reports, only: [:show, :index]
  resources :shareholders, only: [:show, :index]
  resources :categories, only: :show do
    # resources :reports, only: :show
  end

  resources :pages, only: :show

  resource :search, only: :show

  resource :map do
    member do
      get 'get_all_deposits'
      get 'get_all_processing_infrastructures'
      get 'get_all_social_projects'
    end
  end

  get "/sitemap.xml" => "sitemap#index", :format => "xml", :as => :sitemap


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

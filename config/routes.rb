Rails.application.routes.draw do

  get 'samples/show'
  get 'contact_us/index'
  get 'offered_solutions/index'
  

  get 'services/index'
  get 'services/overview'
  get 'services/business_plans'
  get 'services/entrepreneurship'
  get 'services/project_management'
  get 'services/engineering_designs'
  get 'services/financial_management'
  get 'services/solar_energy_consulting'
  get 'services/business_modeling'
  get 'services/business_development'


  get 'about_us/index'

  resources :entrepreneur_programs
  resources :engineering_mgmts
  resources :design_engineerings
  resources :business_managements
  resources :solar_panels
  resources :solutions
  resources :our_advantages
  resources :recent_projects
  
  
  get 'users/update_sections', :as => 'update_sections'
  get 'users/update_topics', :as => 'update_topics'

  get 'manage_resources/index'
  get 'home/index'

  resources :outlines do
    collection { post :import }
  end

  resources :profile_pages do
    collection { put :change_password }
  end

  resources :sample_business_plans do
    collection { post :import }
  end

  resources :sections do
    collection { post :import }
  end

  resources :topics do
    collection { post :import }
  end

  devise_for :users, :controllers => {:registrations => "register", :sessions => "login"}

  devise_scope :user do
    authenticated :user do
      root :to => 'manage_resources#index'
    end
    unauthenticated :user do
      root :to => 'home#index', as: :unauthenticated_root
    end
    get "/users/sign_out", :to => "devise/sessions#destroy"
  end

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

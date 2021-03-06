Waste5::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => 'posts#browse'

  resources :posts
  resources :comedians
  resources :reports

  match '/admin', :to => 'pages#admin'
  match '/homescreen', :to => 'pages#homescreen'
  match '/random', :to => 'pages#show_video_list'
  match '/latest', :to => 'pages#show_latest'
  match '/popular', :to => 'pages#show_popular'
  match '/longest', :to => 'pages#show_longest'

  
  match '/search', :to => 'posts#search'
  match '/report', :to => 'reports#report'
  match '/destroy_reports', :to => 'reports#reportsgoboom'


  match '/all_comedians', :to => 'comedians#all_comedians'

  match '/browse', :to => 'posts#browse'
  match '/short', :to => 'pages#short'
  match '/medium', :to => 'pages#medium'
  match '/long', :to => 'pages#long'
  match '/african_american', :to => 'pages#african_american'
  match '/white', :to => 'pages#white'
  match '/mei', :to => 'pages#mei'
  match '/asian', :to => 'pages#asian'
  match '/latino', :to => 'pages#latino'
  match '/all', :to => 'pages#all'


  resources :tags, only: [] do
    get :autocomplete_tag_name, :on => :collection
  end

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

end

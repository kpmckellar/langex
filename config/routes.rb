Rails.application.routes.draw do



  resources :roles
  resources :tags
  resources :topics
  resources :meetings
  resources :languages
  resources :languages_users
  # resources :conversations, only: [:index, :show, :destroy]
  resources :messages, only: [:new, :create]
  
  #resources :meetings, only: [new edit show create], controller: "home"

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :restore
    end
  end
  # end
  resources :conversations, only: [:index, :show, :destroy] do
    collection do
      delete :empty_trash
    end
  end
    
  
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users
  # resources :users do
  #   post :admin #-> url.com/users/:user_id/admin
  # end
  

  

  # scope "/admin" do
    
  # end
 
  
  root 'welcome#index'
  get 'messages/send_message', to: 'messages#send_message', as: 'send_message'
  get 'profile/home', to: 'profile#home', as: 'home' 
  get 'profile/:id/view', to: 'profile#view', as: 'view' 
  get 'profile/:languages_user_id/manage', to: 'profile#manage', as: 'manage'
  get 'profile/admin_view', to: 'profile#admin_view', as: 'admin_view'
  get 'languages_users/:id/edit', to: 'languages_users#edit', as: 'edit'
  get 'languages_users/:id/sign_up', to: 'languages_users#sign_up', as: 'sign_up'
  #get 'users/:user_id/challenges' => 'challenges#user_challenges', as: :user_challenges
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

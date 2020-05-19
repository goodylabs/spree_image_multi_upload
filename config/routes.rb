Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :products do
      resources :images do
        get :multi_upload, on: :collection
        post :create_multiple, on: :collection
      end
    end
  end
end

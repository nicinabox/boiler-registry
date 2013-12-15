GatRegistry::Application.routes.draw do
  resources :packages, except: [:new, :edit] do
    get 'search/:name' => 'packages#search', on: :collection
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'packages#index'
end

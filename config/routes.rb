Rails.application.routes.draw do
  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to
  # Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the
  # :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being
  # the default of "spree".
  mount Spree::Core::Engine, at: '/'
  Spree::Core::Engine.add_routes do
    get '/credit_cards', to: 'credit_cards#index'
    get '/credit_cards/new', to: 'credit_cards#new'
    post '/credit_cards/new', to: 'credit_cards#create'
    delete '/credit_cards/:id', to: 'credit_cards#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get('/about', { to: 'welcome#about', as: :about })
  get('/contact_us', { to: 'contacts#index', as: :contact })
  post('/contact_us', { to: 'contacts#create' })

  resources :products do
    # creates the following route for us:
    # post('/products/:product_id/reviews', { to: 'reviews#create', as: :product_reviews })
    # Which, due to the `as` creates a method called `product_reviews_path`
    # This method requires one variable, a product or product id to "fill in"
    # the value for `:product_id` in the path
    # It returns the value: '/products/:product_id/reviews' with the :product_id
    # "filled in"
    resources :reviews, shallow: true, only: [:create]
  end
end

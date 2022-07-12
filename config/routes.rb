Rails.application.routes.draw do
  root "book_pages#index"
  resources :books
  resources :book_pages
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end

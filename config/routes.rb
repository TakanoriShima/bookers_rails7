Rails.application.routes.draw do
  get 'homes/top'
  get 'books/index'
  get 'books/new'
  get 'books/show'
  get 'books/edit'
  get 'book/index'
  get 'book/new'
  get 'book/show'
  get 'book/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'homes#top'
  resources :books
end

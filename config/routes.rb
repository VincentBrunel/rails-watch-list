Rails.application.routes.draw do
  # get 'bookmarks/index'
  # get 'bookmarks/new'
  # get 'bookmarks/create'
  # get 'bookmarks/show'
  # # get 'lists/index'
  # get 'lists/show'
  # get 'lists/new'
  # get 'lists/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "lists", to: "lists#index"
  # get "lists/new", to: "lists#new"
  # get "lists/:id", to: "lists#show", as: :show
  # post "lists", to: "lists#create"

  resources :lists do 
    resources :bookmarks, only: [:new, :create]
  end

  # get "bookmarks/new", to: "bookmarks#new"
  # get "bookmarks", to: "bookmarks#create"
  delete "bookmarks/:id", to: "bookmarks#destroy", as: :destroy
end

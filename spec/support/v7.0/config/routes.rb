# typed: false
Rails.application.routes.draw do
  get 'test/index' => 'test#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

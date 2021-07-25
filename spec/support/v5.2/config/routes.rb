# typed: ignore
Rails.application.routes.draw do
  get 'test/index' => 'test#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

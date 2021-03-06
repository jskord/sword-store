Rails.application.routes.draw do
  get '/' => 'products#index'
  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
  get '/products/:id' => 'products#show'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'
  post '/search' => 'products#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

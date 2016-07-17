Rails.application.routes.draw do
  resources :s3images
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'

end

Rails.application.routes.draw do
  
  get 'category/index'

  get 'category/new'

  devise_for :users
  root 'public#index'

  match ':controller(/:action(/:id))', :via => [:get, :post]



end

Rails.application.routes.draw do
  
  devise_for :users
  root 'public#index'

  match ':controller(/:action(/:id))', :via => [:get, :post]



end

Rails.application.routes.draw do
  
 
  root 'public#index'

  match ':controller(/:action(/:id))', :via => [:get, :post]


end

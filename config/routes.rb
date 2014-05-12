Rails.application.routes.draw do

  get '/orders/:id', to: 'orders#show', as: :order
  get 'magazines/:id', to: 'magazines#show', as: :magazine
end

Rails.application.routes.draw do
  root 'urls#index'
  get '/:id' => 'urls#show'
  resources :urls
end

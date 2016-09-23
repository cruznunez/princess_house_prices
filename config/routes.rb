Rails.application.routes.draw do
  root 'items#new'
  resources :items

  get 'preview' => 'items#preview'
end

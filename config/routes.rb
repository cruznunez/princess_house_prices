Rails.application.routes.draw do
  root 'items#new'
  resources :items, only: [:new, :create]
  get 'preview' => 'items#preview'
end

Rails.application.routes.draw do
  resources :exercises
  root to: 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations'}
end

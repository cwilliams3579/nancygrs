Rails.application.routes.draw do
  resources :reviews
  root to: 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations'}

  resources :exercises do
    resources :reviews, except: [:show, :index]
  end
end

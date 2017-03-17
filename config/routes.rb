Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}

  resources :exercises do
    resources :reviews, except: [:show, :index]
  end
  root to: 'visitors#index'
end

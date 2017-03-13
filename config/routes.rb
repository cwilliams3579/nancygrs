Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations'}

  resources :exercises do
    resources :reviews, except: [:show, :index]
  end
end

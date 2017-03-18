Rails.application.routes.draw do
  resources :testimonials
  devise_for :users, :controllers => { registrations: 'registrations'}

  resources :exercises do
    member do
      put "like", to: "exercises#upvote"
    end
    resources :reviews, except: [:show, :index]
  end
  root to: 'visitors#index'
end

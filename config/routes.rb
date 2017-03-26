Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}

  resources :posts do
    resources :comments, only: [:create]
  end

  resources :testimonials

  resources :exercises do
    member do
      put "like", to: "exercises#upvote"
      put "dislike", to: "exercises#downvote"
    end
    resources :reviews, except: [:show, :index]
  end

  resources :contacts, only: [:new, :create] 

  root to: 'visitors#index'
  mount ActionCable.server => '/cable'
end

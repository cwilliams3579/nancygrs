Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :posts
  resources :testimonials

  resources :comments
  resources :exercises do
    member do
      put "like", to: "exercises#upvote"
      put "dislike", to: "exercises#downvote"
    end
    resources :reviews, except: [:show, :index]
  end
  root to: 'visitors#index'

  # post '/exercises/:exercise_id/reviews'
end

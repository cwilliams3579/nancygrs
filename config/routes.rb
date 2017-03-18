Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :testimonials
  devise_for :users, :controllers => { registrations: 'registrations'}

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

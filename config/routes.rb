Rails.application.routes.draw do
  # scope ":locale", locale: /#{I18n.available_locales.join["|"]}/ do
    devise_for :users, :controllers => { registrations: 'registrations'}

<<<<<<< HEAD
  resources :posts do
    resources :comments, only: [:create]
  end

  resources :testimonials
=======
    resources :posts do
      resources :comments, only: [:create]
    end
    resources :testimonials
>>>>>>> fb80673be364f3a98b2acde5ff4f77f3e7903c4f

    resources :exercises do
      member do
        put "like", to: "exercises#upvote"
        put "dislike", to: "exercises#downvote"
      end
      resources :reviews, except: [:show, :index]
    end
<<<<<<< HEAD
    resources :reviews, except: [:show, :index]
  end

  resources :contacts, only: [:new, :create] 

  root to: 'visitors#index'
  mount ActionCable.server => '/cable'
=======
    root to: 'visitors#index'
    mount ActionCable.server => '/cable'
  # end
>>>>>>> fb80673be364f3a98b2acde5ff4f77f3e7903c4f
end

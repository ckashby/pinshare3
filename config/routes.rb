Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  resources :posts
  resources :pins do
    member do
      put "like", to: "pins#upvote"
      put "dislike", to: "pins#downvote"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

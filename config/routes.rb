Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :links do
    member do # 有id
      put "like",    to: "links#upvote"
      put "dislike", to: "links#downvote"
    end
    resources :comments
  end

  # 不只一個model （通常一個resource就是一個model）
  namespace :backstage do
    resources :users do
      resources :links
    end
    root "users#index"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "links#index"
end

Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :posts, only: %i[index show new create destroy] do
    resources :comments, only: %i[create destroy], shallow: true
    resources :likes, only: %i[create destroy], shallow: true
  end
end

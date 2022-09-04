Rails.application.routes.draw do
  devise_for :users

  resources :posts, only: %i[index show new create destroy] do
    resources :comments, only: %i[create destroy], shallow: true
  end

  root 'posts#index'
end

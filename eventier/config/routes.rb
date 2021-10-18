Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'events/search' => 'events#search'
  get 'users/search' => 'users#search'
  resources :events do
    resource :favorites, only: [:create, :destroy]
    resources :event_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followwings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end

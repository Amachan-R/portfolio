Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  resources :events do
    resource :favorites, only: [:create, :destroy]
    resources :event_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]

end

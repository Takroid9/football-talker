Rails.application.routes.draw do


  
 
  devise_for :admins
  devise_for :talkers
  
  scope module: :public do
    root to: 'homes#top'
    resources :leagues, only: [:index, :show]
    resources :teams, only: [:index, :show]
      get 'search/sort_recommend', to: 'players#search', as: 'sort_recommend'
      get 'search/sort_comment', to: 'players#search', as: 'sort_comment'
    resources :players, only: [:index, :show, :edit, :update] do
      resources :recommends, only: [:create, :destroy]
      resources :comments, only: [:index, :show, :edit, :update, :create, :destroy] do
        resource :favorites, only: [:create, :destroy]
      end
      collection do
        get 'search'
      end
    end
    resources :talkers, only: [:show, :edit, :update]
    resources :comments, only: [:index, :show, :edit, :update, :create, :destroy]
    resources :contacts, only: [:new, :create]
    get '/contacts/complete' => 'contacts#complete'
    resources :recommends
    resources :notifications, only: [:index]
    
  end
  
  namespace :admin do
    get 'homes/top'
    resources :leagues
    resources :teams
    resources :players
    resources :talkers
    resources :contacts, only: [:index, :show, :update]
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

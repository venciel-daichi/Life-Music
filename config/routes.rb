Rails.application.routes.draw do
  # get 'relationships/create'
  # get 'relationships/destroy'
  get '/about' => 'users#about' , as: 'about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
  resources :favorite_musics, only: [:new, :edit, :create, :update, :destroy]
  resources :musics do
	  resource :favorites, only: [:create, :destroy]
  end
  root 'musics#index'
  get '/top' => 'users#top' , as: 'top'
  get '/fav' => 'favorites#index' , as: 'favs'
  get '/follow' => 'relationships#index', as: 'follows'
  end

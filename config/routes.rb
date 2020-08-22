Rails.application.routes.draw do
  devise_for :users
  get 'relationships/create'
  get 'relationships/destroy'
  root 'home#top'
  get 'home/about'
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, except: [:new] do
	resources :book_comments, only: [:create, :destroy]
	resource :favorites, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
	get :follows, on: :member # 追加
	get :followers, on: :member # 追加
  end

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

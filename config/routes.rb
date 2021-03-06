Rails.application.routes.draw do
  devise_for :users
  post 'relationship/create'
  post 'relationship/destroy'
  root 'home#top'
  get 'home/about'
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, except: [:new] do
	resources :book_comments, only: [:create, :destroy]
	resource :favorites, only: [:create, :destroy]
  end
    

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

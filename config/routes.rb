Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get 'home/about'=>"homes#about",as:'about'
  resources :books, only: [:index, :show, :new, :create, :destroy, :edit, :update]
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

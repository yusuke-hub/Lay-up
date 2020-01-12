Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/edit'
  get 'groups/show'
  get 'plans/index'
  get 'plans/show'
  get 'plans/edit'
  get 'homes/about'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index,:show,:edit,:update]
  resources :plans, only: [:index,:create,:show,:edit,:update,:destroy]
end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  :to => 'homes#about'
  resources :users, only: [:index,:show,:edit,:update]
  resources :plans, only: [:index,:new, :create,:show,:edit,:update,:destroy]
  resources :groups, only: [:new,:index,:create,:show,:edit,:update,:destroy]
end

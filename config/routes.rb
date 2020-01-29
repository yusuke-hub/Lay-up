Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'homes#top'
  get '/plans/detail/:id', to: 'plans#detail', as: 'plan_detail'
  get '/groups/confirm', to: 'groups#confirm', as: 'group_confirm'
  resources :users, only: [:index,:show,:edit, :destroy, :update]
  resources :plans, only: [:index,:new, :create,:show,:edit,:update,:destroy] do
    resources :comments, only:[:show, :create, :destroy]
  end
  resources :groups, only: [:new,:index,:create,:show,:edit,:update,:destroy]
  resources :belongings, only: [:create, :destroy, :update]
end

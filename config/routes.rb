Rails.application.routes.draw do
  root to: 'pages#index'

  get 'pages/index'

  get 'pages/friends'

  get 'pages/messages'

  get 'pages/friends_on_map'

  get 'pages/gallery'

  get 'pages/cloud'

  get 'pages/settings'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

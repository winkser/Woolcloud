Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'pages/index'

  get 'pages/friends'

  get 'pages/messages'

  get 'pages/friends_on_map'

  get 'pages/gallery'

  get 'pages/cloud'

  get 'pages/settings'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

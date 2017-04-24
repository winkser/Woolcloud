Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'pages/index'

  get 'pages/friends'
 
  post 'pages/friends', to: "pages#friends_add", as: "pages_friends_add"

  delete 'pages/friends/:id', to: "pages#friends_drop", as: "pages_friends_drop" 

  get 'pages/messages'

  get 'pages/friends_on_map'

  get 'pages/gallery'

  get 'pages/cloud'

  get 'pages/settings'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'pages/index'

  get 'pages/friends', to: "friends#friends", as: "pages_friends"
  post 'pages/friends', to: "friends#friends_add", as: "pages_friends_add"
  delete 'pages/friends/:id', to: "friends#friends_drop", as: "pages_friends_drop" 

  get 'pages/messages'

  get 'pages/friends_on_map'

  get 'pages/galleries'
  post 'pages/galleries/create/image', to: "galleries#create_image", as: "pages_galleries_create_image"
  get 'pages/galleries/delete/:id', to: "galleries#delete", as: "pages_galleries_delete"

  get 'pages/cloud', to: "clouds#cloud", as: "pages_cloud"
  get 'pages/cloud/home', to: "clouds#home", as: "pages_cloud_home"
  get 'pages/cloud/back', to: "clouds#back", as: "pages_cloud_back"
  post 'pages/cloud', to: "clouds#upload", as: "pages_cloud_upload"
  get 'pages/cloud/open/:id', :constraints => { :id => /.*/ }, to: "clouds#open", as: "pages_cloud_open"
  get 'pages/cloud/delete/:id', :constraints => { :id => /.*/ }, to: "clouds#delete", as: "pages_cloud_delete"
  get 'pages/cloud/newfolder', to: "clouds#newfolder", as: "pages_cloud_newfolder"
  

  get 'pages/settings'
  post 'pages/settings/create/avatar', to: "settings#create_avatar", as: "pages_settings_create_avatar"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

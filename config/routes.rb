Rails.application.routes.draw do

  get 'welcome/new'

  resources :users
  resources :sessions
  root 'welcome#new'
end

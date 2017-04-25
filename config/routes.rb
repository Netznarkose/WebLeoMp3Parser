Rails.application.routes.draw do

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  resources :users
  resources :entries, only: [:new, :index, :create, :destroy]
  get 'entries/remove_all'
  get 'attachments/download'
  resources :sessions
  root 'sessions#new'
end

Rails.application.routes.draw do
  	devise_for :users
	root to: "welcome#index"

	resources :meetups

	resources :comments, only: [:create]
end

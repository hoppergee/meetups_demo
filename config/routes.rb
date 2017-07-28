Rails.application.routes.draw do
  	devise_for :users
	root to: "meetups#index"

	resources :meetups

	resources :comments, only: [:create]
end

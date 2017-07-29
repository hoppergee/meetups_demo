Rails.application.routes.draw do
  	devise_for :users
	root to: "meetups#index"

	resources :meetups

	resources :comments, only: [:create]

	namespace :api, :defaults => { :format => :json } do
		namespace :v1 do
			
			post "/signup" => "auth#signup"
			post "/login" => "auth#login"
			post "/logout" => "auth#logout"

		end
	end
end

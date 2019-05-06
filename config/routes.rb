Rails.application.routes.draw do

  	root "pages#home"
  	get "about", to: "pages#about"

	resources :articles

	get "register", to: "users#new"
	resources :users, except: [:new] do
	  get :add_company
	end

	get "login", to: "sessions#new"
	post "login", to: "sessions#create"
	delete "logout", to: "sessions#destroy"

	resources :companies
	resources :events
	resources :text_questions

	namespace :admin do
		get '', to: 'pages#home'
		resources :users
		resources :text_questions
	end

end

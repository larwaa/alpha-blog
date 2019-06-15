Rails.application.routes.draw do

  	root "pages#home"
  	get "about", to: "pages#about"

	resources :articles

  get "categories/new", as: "new_category", to: "admin/categories#new"
  post "categories", to: "admin/categories#create"
	resources :categories, except: [:delete, :new, :create]


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
	resources :answers

	namespace :admin do
		get '', to: 'pages#home'
		resources :users
		resources :text_questions
	end

end

Rails.application.routes.draw do

	scope "(:locale)", locale: /en|es/ do
		root to: "pages#home"
		devise_for :users
	  resources :users
	  resources :tutors, path: :volunteers
	  resources :students
	  resources :klasses, path: :classes
	end

	get '/:locale' => 'pages#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

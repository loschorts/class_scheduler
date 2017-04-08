Rails.application.routes.draw do

	scope "(:locale)", locale: /en|es/ do
		root to: "pages#home"
		get "search", to: "classes#index"
		devise_for :user, except: [:sign_up], path: "/", path_names: {
			edit: "profile", 
			sign_in: "login",
			sign_up: "signup"
		},
		controllers: {
			registrations: "users/registrations"
		}

	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

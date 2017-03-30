Rails.application.routes.draw do

  resources :users
  resources :tutors
  resources :students
  resources :klasses, path: :classes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

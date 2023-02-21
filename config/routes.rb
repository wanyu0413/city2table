Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "courses#index"
  resources :courses, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
  end
  namespace :chef do
    resources :bookings, only: [:index]
  end
  resources :bookings, only: [:index, :update]
end


# /	GET	pages	home
# /courses	GET	courses	index
# /courses/id	GET	courses	show
# /courses/id/bookings	POST	bookings	create
# /bookings	GET	bookings	index

# /courses	GET/POST	courses	new/create
# /chef/bookings	GET	/chef/bookings	index
# bookings/id	PATCH	bookings	update

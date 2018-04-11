Rails.application.routes.draw do

  root to: "meal_postings#index"

  resources :users, except: [:index] do
    resources :meal_postings
    resources :user_ratings, except: [:show, :edit]
  end

  resources :meal_postings do
    resources :categories, only: [:show]
    resources :reservations
    resources :meal_ratings, except: [:show, :edit]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    # COMMENTED OUT FOR NOW #
    # get '/login', to: 'posting#index'

    resources :postings, only: [:index, :new, :create]

    # CREATED FOR SESSIONS
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
    put '/user/location' => 'sessions#update'

    # CREATED FOR MEAL POSTING CATEGORIES
    put '/meal_postings/categories/:id' => 'meal_postings#category', :as => :meals_category

    # CREATED TO SHOW HOSTS / USERS THEIR CURRENT RESERVATIONS / REQUESTS
    get '/reservations' => 'reservations#index'#, :as => :user_reservations

    #TO CHANGE TO ACCEPTED / REJECTED
    put '/reservations/:id/accept' => 'reservations#accept'
    put '/reservations/:id/reject' => 'reservations#reject'

    #TO CREATE A NEW RESERVATION
    put '/users/reservations/create' => 'reservations#create', :as => :create_reservation


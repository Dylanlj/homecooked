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

    # CREATED FOR MEAL POSTING CATEGORIES
    put '/meal_postings/categories/:id' => 'meal_postings#category', :as => :meals_category

end




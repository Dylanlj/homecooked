Rails.application.routes.draw do


  # root to:

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
end




Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'postings#index'

    get '/login', to: 'posting#index'

    resources :postings, only: [:index, :new, :create]
end

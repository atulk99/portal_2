Rails.application.routes.draw do
  # get 'home/sign_out' => 'devise/sessions/#destroy'
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root to: "sessions#index
  # root "articles#index"

  root "home#index"
  get 'pastbookings', to: 'bookings#pastbookings'
  get 'futurebookings', to: 'bookings#futurebookings'
  devise_for :users

  resources :bookings
  # resources :properties
  resources :properties do 
    member do 
      get :bookings
    end
  end

end

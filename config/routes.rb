Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users do
    resources :questions, only: [:index]
    resources :answers, only: [:index]
  end

  resources :questions
  resources :answers
  resources :likes, only: [:create, :destroy]

end

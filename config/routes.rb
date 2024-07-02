Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "loan_users#new"

  resource :loan_users, only: [:new, :create, :show]
end

Rails.application.routes.draw do
  get "bmi", to: "bmi#index"
  # 180102 Accidently found that when I reload the Bmi#index page, Routing Error occurs
  # so I add [POST] "/bmi"
  post "bmi", to: "bmi#index"
  post "bmi/result", to: "bmi#result"

  get "/hello_world", to: "pages#hello"
  root "welcome#index"
  # 171108 'resources':
  # A method to create 8 different routes that direct to each controllers
  # TO check the routes list: $ rails routes
  resources :users
  resources :posts #, shallow: true
  # end
  # resources :orders do
  #   posts :confirm, on: :member
  #   delete :cancel, on: :member
  # end
  resources :candidates do
    post :vote, on: :member
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

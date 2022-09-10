Rails.application.routes.draw do
  root "posts#index"

  resources :posts
  resource :session, only: %i[new create destroy]
end

Rails.application.routes.draw do 
  resources :students, only: [:index, :show]
  resources :grades, only: [:index, :create]
end

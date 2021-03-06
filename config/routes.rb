Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "scores#index"
  resources :scores, only: [:index, :show]
  resources :words, except: [:show]

end

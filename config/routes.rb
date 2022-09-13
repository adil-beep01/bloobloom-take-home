Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :frames,  only: [:create]
  resources :lenses,  only: [:create, :index]
  resources :glasses, only: [:create]
  get "/frames/:user_id", to: "frames#index"
  get "/glasses/:user_id", to: "glasses#index"
end

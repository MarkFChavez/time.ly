Rails.application.routes.draw do
  root "home#index"

  get "/auth/github/callback" => "sessions#create", as: :callback
  delete "/logout" => "sessions#destroy", as: :logout

  resource :dashboard, only: [:show]
  resources :tokens, only: [:create] do
    collection do
      get "/fetch_token" => "tokens#fetch_token", as: :fetch
    end
  end
  resources :messages, only: [:create]
end

Rails.application.routes.draw do
  root "home#index"

  get "/auth/github/callback" => "sessions#create", as: :callback
end

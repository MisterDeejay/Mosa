Rails.application.routes.draw do
  root to: 'static_pages#root'

  StaticPagesController.action_methods.each do |action|
    get "/#{action}", to: "static_pages##{action}", as: "#{action}_page"
  end

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:create, :destroy]

  get "/login", to: "sessions#new", as: "action_page"

  namespace :api, defaults: { format: :json } do
    resources :restaurants, only: [:index, :show]
    resources :reviews, only: [:create, :update, :destroy]
  end
end

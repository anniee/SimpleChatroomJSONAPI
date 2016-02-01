Rails.application.routes.draw do
  root to: "events#index"
  get 'events/' => 'events#index'
  get '/events/summary' => 'events#index'
  post '/events/clear' => 'events#clear'
  get ':username' => 'events#index'
  resources :events, only: [:index, :show, :create, :update, :destroy]
end

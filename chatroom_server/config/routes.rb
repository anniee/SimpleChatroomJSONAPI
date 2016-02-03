Rails.application.routes.draw do
  root to: "events#index"
  get 'events/' => 'events#index'
  get '/events/clear' => 'events#clear'
  get '/events/summary' => 'events#summary'
  get ':username' => 'events#index'
  resources :events, only: [:index, :show, :create, :update, :destroy]
end

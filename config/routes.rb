Rails.application.routes.draw do
  root 'sessions#new'

  resources :poker_rooms
  resource :session, except: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, format: :json, constraints: { format: :json } do
    namespace :v1 do
      resources :messages, only: :create
      resource :chat_rooms, only: :create
    end
  end

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end

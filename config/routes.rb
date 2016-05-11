Rails.application.routes.draw do
  devise_for :users
  root 'chat_rooms#index'

  scope 'chat_rooms/:id' do
    get '/' => 'messages#index'
    post '/' => 'messages#create'
  end

  resources :chat_rooms, except: :show
  resources :poker_rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, format: :json, constraints: { format: :json } do
    namespace :v1 do
      resources :messages, only: :create
      resource :chat_rooms, only: :create
      get 'chat_rooms/:room_id/messages' => 'messages#index'
    end
  end

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end

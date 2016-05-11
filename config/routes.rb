Rails.application.routes.draw do
  devise_for :users
  root 'chat_rooms#index'

  scope 'chat_rooms/:id' do
    get '/' => 'messages#index'
    post '/' => 'messages#create'
  end

  resources :chat_rooms, except: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end

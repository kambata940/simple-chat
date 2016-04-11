class SessionsController < ApplicationController
  skip_before_action :require_username, only: [:new, :create]

  def new
  end

  def create
    user = User.new(name: params[:name])

    if user.save
      cookies.signed[:username] = user.name
      session[:username] = user.name
      redirect_to poker_rooms_path
    else
      render :new
    end
  end
end

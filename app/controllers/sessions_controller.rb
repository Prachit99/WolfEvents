class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    attendee = Attendee.authenticate(params[:email], params[:password])
    if attendee
      session[:id] = attendee.id
      redirect_to root_url
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_url
  end
end

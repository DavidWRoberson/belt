class SessionsController < ApplicationController
  def create
    user = User.where(email: params[:session][:email]).first
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to '/ideas'
    else
      flash[:error] = "Invalid Credentials"
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(user_params)
#binding.pry
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash[:error] = 'Failed to log in.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end

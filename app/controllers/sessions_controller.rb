class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :tasks, notice: 'Logged Out, Goodbye!'
    else
      flash[:notice] = 'Unable to login, can not verify the user!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out, Goodbye!'
  end
end

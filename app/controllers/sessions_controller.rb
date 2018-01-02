class SessionsController < ApplicationController
  def new
  end
  #  def create
  #    user = User.find_by(email: params[:session][:name])#.downcase)
  #    if user && user.authenticate(params[:session][:password])
  #      reset_session
  #      session[:user_id] = user.id
  #      redirect_to user
  #      else(すべてのコントローラーで使いたいのでhelperに移行。)
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  # def destroy
  #    reset_session
  #    redirect_to login_url
  #  end(すべてのコントローラーで使いたいのでhelperに移行。)
  def destroy
    log_out
    redirect_to login_url
  end
end

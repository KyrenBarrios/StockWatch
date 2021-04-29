class SessionsController < ApplicationController

  def logout
    session.clear
    redirect_to root_path
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Incorrect login info, please try again"
      redirect_to "/login"
    end
  end

  def google
    @user = User.find_or_create_by(email: auth["info"]["email"]) do |user| 
        user.name = auth["info"]["first_name"]
        user.password =  SecureRandom.hex(10)
    end 
    if @user && @user.id
        session[:user_id] = @user.id
        redirect_to stocks_path 
    else 
        redirect_to new_user_path
    end 
end 
def home 
end 

  private

  def auth
    request.env['omniauth.auth']
  end

  
end
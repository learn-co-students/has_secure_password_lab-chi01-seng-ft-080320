class SessionsController < ApplicationController
  
  # current_user happens before all actions
  # def current_user
  #   @user = (User.find_by(id: session[:user_id]) || User.new)
  # end

  def new
  end

  def create
    # find a user by their name
    user = User.find_by(name: params[:user][:name])

    # Authenticate a user by their password
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash[:error] = "Passwords need to match"
      redirect_to new_login_path
    end

  end #end of #create


  def destroy
    session.delete(:user_id)
    redirect_to home_path
  end

end #end of sc class

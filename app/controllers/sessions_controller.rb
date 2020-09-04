class SessionsController < ApplicationController


    def destroy
        session.delete(:user_id)
        redirect_to home_path
    end

    def signup
    end

    def new
    end

    def login
        user = User.find_by(name: params[:user][:name])
        if user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to home_path
        else
            flash[:error] = "Username or Password Incorrect"
            redirect_to new_login_path
        end
    end
 
end

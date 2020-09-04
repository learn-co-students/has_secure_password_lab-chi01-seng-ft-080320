class UsersController < ApplicationController

    def new
        
    end

    def create
        @user = User.create(user_params)

        if @user.valid?
            session[:user_id] = @user.id
            redirect_to home_path
        else
            flash[:error] = "passwords need to match"
            redirect_to new_user_path
        end

    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)  
    end

end #end of uc class

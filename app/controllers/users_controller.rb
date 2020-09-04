class UsersController < ApplicationController
    before_action :logged_in
    skip_before_action :logged_in, only: [:create, :new]

    def home
    end

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        user = User.create(name: params[:user][:name],password: params[:user][:password])
        session[:user_id] = user.id
        redirect_to home_path
    end

end

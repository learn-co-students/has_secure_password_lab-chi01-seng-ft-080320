class ApplicationController < ActionController::Base
  before_action :logged_in
  skip_before_action :logged_in


  def logged_in
    if session.include? :user_id
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to new_login_path
    end
  end






  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

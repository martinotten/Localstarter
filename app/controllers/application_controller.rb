class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def user_location
    session[:user_location] ||= request.location
    @user_location ||= session[:user_location]
    logger.debug session
  end
end

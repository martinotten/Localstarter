class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def user_location
    location = {}
    if request.remote_ip === '127.0.0.1'
      location = {longitude: 2.2945, latitude: 48.8582}  
    else
      location = request.location
      location = {longitude: location.longitude, latitude: location.latitude}
    end
    session[:user_location] ||= location
    @user_location ||= session[:user_location]
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def user_location
    return [50.9800403, 6.847598199999999]
    location = {}
    if request.remote_ip === '127.0.0.1'
      location = [50.9800403, 6.847598199999999]
    else
      location = request.location
      location = [location.latitude, location.longitude]
    end
    session[:user_location] ||= location
    @user_location ||= session[:user_location]
  end
end

class SessionsController < ApplicationController
  
  def create 	
    require "yaml"
    File.open('data.yml','w') do |f|
	  f.write env["omniauth.auth"].to_yaml
    end
    auth = request.env["omniauth.auth"]
    user = User.from_omniauth(env["omniauth.auth"])

   # user = User.where(:provider => auth["provider"], 
   # :uid => auth["uid"]).first_or_initialize(
   # :email => auth["info"]["email"],
   # :location => auth["info"]["location"],
   #:birthday => auth["extra"]["raw_info"]["birthday"],
   # :name => auth["info"]["name"])
     
    session[:user_id] = user.id
    session['fb_auth'] = auth
    session['fb_access_token'] = auth['credentials']['token']
    session['fb_error'] = nil
    
    redirect_to user_url(user)
  end

  def destroy
    reset_session
    redirect_to root_url
  end

end


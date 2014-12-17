class LikesController < ApplicationController

 def index
     @pages = Array.new
     @users_pages = Array.new


     if session["fb_access_token"].present?
      graph = Koala::Facebook::GraphAPI.new(session["fb_access_token"]) # Note that i'm using session here
      @fb_access_token = session["fb_access_token"]
      @profile_image = graph.get_picture("me")
      @fbprofile = graph.get_object("me")
      @pages = graph.get_connections("me", "likes?limit=1000&offset=0")
      #@friends = graph.get_connections("10152329149212230", "email")
      @pages.each do |page|
      @users_pages << Page.from_history(page)
      end

      user = User.find(session[:user_id])
      user.pages = @users_pages

     #if @likes.present?
      #@likes.each do |like|
      #	like['category']
      #end
     #respond_to do |format|
     	#format.html # index.html.erb
      #format.json { render json: @likes }
     #end
    end  
 end

end

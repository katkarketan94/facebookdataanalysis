class UsersController < ApplicationController
   
   def show
  #@current_user = User.find(params[:uid])
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  
  #sql = ActiveRecord::Base.connection();
  #@sql_adventure = sql.execute(" SELECT * FROM facebooklikes_development.abouts WHERE genre LIKE '%Adventure%' ")
 
   @genre = ['Adventure', 'Comedy', 'Drama', 'Crime', 'Romantic']

   @adventure = About.where("genre LIKE '%Adventure%'")
   @action = About.where("genre LIKE '%Action%'")
   @adventure_number = @adventure.size + @action.size

   @comedy = About.where("genre LIKE '%Comedy%'")
   @comedy_number = @comedy.size

   @drama = About.where("genre LIKE '%Drama%'")
   @drama_number = @drama.size

   @Crime = About.where("genre LIKE '%Crime%'")
   @crime_number = @Crime.size

   @romantic = About.where("genre LIKE '%Romantic%'")
   @romance = About.where("genre LIKE '%Romance%'")
   @romantic_number = @romantic.size + @romance.size

   @newmovie = Array.new
   #@newmovie_id = Array.new
   latest_movie = Imdb::Search.new("2014")
   i = latest_movie.movies
   i.each do |movie|
   	@newmovie << movie.title
   	#@newmovie_id = movie.id
   	#@k = Imdb::Movie.new(@newmovie_id)
   	#@year = @k.year
   end

   fgraph = Koala::Facebook::GraphAPI.new(session["fb_access_token"]) # Note that i'm using session here
   @friends = fgraph.get_connections("me","friends") 

  @current_user_birthday = @current_user.birthday
  @birthday = @current_user_birthday.to_datetime
   now = Date.today
   @year = now.year - @birthday.year
   end

end

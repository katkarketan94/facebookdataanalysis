class FavouritesController < ApplicationController
	def index

	  auths = session['fb_auth']
	  @atheletes = auths["extra"]["raw_info"]["favorite_athletes"]
          @myatheletes = Array.new

    if @atheletes != nil
    	@atheletes.each do |athelete| 
      @myatheletes << Favourite.sports_from_history(athelete)
     end
    end

	  @teams = auths["extra"]["raw_info"]["favorite_teams"]
          @myteams = Array.new

	  if @teams != nil
      @teams.each do |team|
      @myteams << Favourite.sports_from_history(team)
      end
     end 

	  @movies = Array.new
 	  @music = Array.new
	  @books = Array.new
	  @television = Array.new

     if session["fb_access_token"].present?
      graph = Koala::Facebook::GraphAPI.new(session["fb_access_token"]) # Note that i'm using session here
      @profile_image = graph.get_picture("me")
      @fbprofile = graph.get_object("me")
      @movies = graph.get_connections("me", "movies?limit=100&offset=0")
      @music = graph.get_connections("me", "music?limit=100&offset=0") 
      @books = graph.get_connections("me", "books?limit=100&offset=0")  
      @television = graph.get_connections("me", "television?limit=100&offset=0")  
     
           @mymovies = Array.new

     if @movies != nil
      @movies.each do |movie|
      session["page_id"] = movie["id"]
      @movies_about = graph.get_object(session["page_id"])
      f = Favourite.from_history(movie)
      @mymovies << f
      f.about = About.from_history(@movies_about)
      f.save

      end
    end
          @mymusic = Array.new

     if @music != nil   
      @music.each do |music|
      session["page_id"] = music["id"]
      @music_about = graph.get_object(session["page_id"])
      f = Favourite.from_history(music)
      @mymusic << f
      f.about = About.from_history(@music_about)
      f.save

      end
     end
           @mybooks = Array.new

     if @books != nil
      @books.each do |book|
      session["page_id"] = book["id"]
      @books_about = graph.get_object(session["page_id"])
      f = Favourite.from_history(book)
      @mybooks << f 
      f.about = About.from_history(@books_about)
      f.save

      end
     end
           @mytelevision = Array.new

     if @television != nil 
      @television.each do |television|
      session["page_id"] = television["id"]
      @television_about = graph.get_object(session["page_id"])
      f = Favourite.from_history(television)
      @mytelevision << f 
      f.about = About.from_history(@television_about)
      f.save

      end
     end 

     @allfavourite = @mytelevision | @mybooks | @mymusic | @mymovies 
     user = User.find(session[:user_id])
     user.favourites = @allfavourite

     @all_about = About.all

      end
	end
end

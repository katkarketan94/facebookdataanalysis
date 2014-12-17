class Favourite < ActiveRecord::Base
  attr_accessible :category, :favourite_id, :name
  has_and_belongs_to_many :users
  belongs_to :about

  def self.from_history(favourite)
    find_by_name_and_favourite_id(favourite["name"], favourite["id"]) || create_favourite(favourite)
   end

   def self.create_favourite(favourite)
    favourite = Favourite.new(:name => favourite["name"],:category => favourite["category"],:favourite_id =>favourite["id"])
    favourite.save
    favourite
   end

  def self.sports_from_history(favourite)
    find_by_name_and_favourite_id(favourite.name, favourite.id) || sports_create_favourite(favourite)
   end

  def self.sports_create_favourite(favourite)
    favourite = Favourite.new(:name => favourite.name, :category => "Sports" ,:favourite_id => favourite.id )
    favourite.save 
    favourite 
  end  

end


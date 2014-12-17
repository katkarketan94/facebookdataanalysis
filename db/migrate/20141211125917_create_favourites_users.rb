class CreateFavouritesUsers < ActiveRecord::Migration
  def change
  	create_table :favourites_users, :id => false do |t|
      t.integer :user_id
      t.integer :favourite_id      
  	end
  end
end

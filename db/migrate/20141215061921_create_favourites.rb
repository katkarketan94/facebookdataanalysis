class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.string :category
      t.string :name
      t.integer :favourite_id
      t.belongs_to :about

      t.timestamps
    end
    add_index :favourites, :about_id
  end
end

class AddGenderToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :hometown, :string
    add_column :users, :relationship_status, :string
    add_column :users, :religion, :string
    add_column :users, :interested_in, :string
    add_column :users, :work, :string
    add_column :users, :sports, :string
    add_column :users, :favorite_athletes, :string
  end
end

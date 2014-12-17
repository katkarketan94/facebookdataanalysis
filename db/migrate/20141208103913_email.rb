class Email < ActiveRecord::Migration
  def up
  	  	remove_column :posts, :email
  end

  def down
  end
end

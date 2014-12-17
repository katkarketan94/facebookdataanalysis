class CreatePagesUsers < ActiveRecord::Migration
  def change
  	create_table :pages_users, :id => false do |t|
      t.integer :user_id
      t.integer :page_id      
  	end
  end
end

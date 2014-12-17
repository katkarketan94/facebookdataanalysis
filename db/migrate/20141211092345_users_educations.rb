class UsersEducations < ActiveRecord::Migration
  def up
  	create_table :users_educations, :id => false do |t|
      t.integer :user_id
      t.integer :education_id      
  	end
  end
end

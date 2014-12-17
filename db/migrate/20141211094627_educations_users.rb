class EducationsUsers < ActiveRecord::Migration
  def change
  	create_table :educations_users, :id => false do |t|
      t.integer :user_id
      t.integer :education_id      
  	end
  end

end

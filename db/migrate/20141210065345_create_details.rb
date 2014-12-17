class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :gender
      t.string :hometown
      t.string :interested_in
      t.string :relationship_status
      t.string :religion

      t.timestamps
    end
  end
end

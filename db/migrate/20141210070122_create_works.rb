class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :company

      t.timestamps
    end
  end
end

class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :high_school
      t.string :college
      t.string :graduate_school

      t.timestamps
    end
  end
end

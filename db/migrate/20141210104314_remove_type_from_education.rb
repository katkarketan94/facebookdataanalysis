class RemoveTypeFromEducation < ActiveRecord::Migration
  def up
    remove_column :educations, :type
  end

  def down
    add_column :educations, :type, :string
  end
end

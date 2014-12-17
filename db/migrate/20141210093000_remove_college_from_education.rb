class RemoveCollegeFromEducation < ActiveRecord::Migration
  def up
    remove_column :educations, :college
    remove_column :educations, :high_school
    remove_column :educations, :graduate_school

  end

  def down
    add_column :educations, :college, :string
    add_column :educations, :high_school, :string
    add_column :educations, :graduate_school, :string

  end
end

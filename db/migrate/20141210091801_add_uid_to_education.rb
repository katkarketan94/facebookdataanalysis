class AddUidToEducation < ActiveRecord::Migration
  def change
    add_column :educations, :uid, :string
    add_column :educations, :school_id, :string
    add_column :educations, :name, :string
    add_column :educations, :type, :string
  end
end

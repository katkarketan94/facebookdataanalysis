class AddUidToPage < ActiveRecord::Migration
  def change
    add_column :pages, :uid, :string
  end
end

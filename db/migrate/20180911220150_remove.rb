
class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :is_admin
    add_column :users, :role, :integer
  end
end

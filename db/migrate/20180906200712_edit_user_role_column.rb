class EditUserRoleColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :role, :integer, 'integer USING CAST(role AS integer)'
  end
end

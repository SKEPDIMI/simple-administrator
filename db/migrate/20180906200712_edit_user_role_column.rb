class EditUserRoleColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :role, :integer, 'integer USING CAST(incident_id AS integer)'
  end
end

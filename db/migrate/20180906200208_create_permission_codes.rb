class CreatePermissionCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :permission_codes do |t|
      t.string :body
      t.string :role

      t.timestamps
    end
  end
end

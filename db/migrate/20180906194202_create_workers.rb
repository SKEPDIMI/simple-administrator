class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :time_worked
      t.string :responsibility
      t.float :pay

      t.timestamps
    end
  end
end

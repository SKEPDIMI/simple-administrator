class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :pay

      t.timestamps
    end
  end
end

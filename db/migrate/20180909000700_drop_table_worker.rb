class DropTableWorker < ActiveRecord::Migration[5.2]
  def change
    drop_table :workers
  end
end

class ChangeIntegerToDecimalInWorkersPay < ActiveRecord::Migration[5.2]
  def change
    change_column :workers, :pay, :decimal
  end
end

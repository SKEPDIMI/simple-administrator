class AddSubContractorIdIndexToTask < ActiveRecord::Migration[5.2]
  def change
    add_index :tasks, :sub_contractor_id
  end
end

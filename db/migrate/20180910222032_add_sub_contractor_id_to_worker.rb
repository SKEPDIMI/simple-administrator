class AddSubContractorIdToWorker < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :sub_contractor_id, :integer
  end
end

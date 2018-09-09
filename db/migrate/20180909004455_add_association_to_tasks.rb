class AddAssociationToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :sub_contractor_id, :integer
    add_column :tasks, :job_id, :integer
  end
end

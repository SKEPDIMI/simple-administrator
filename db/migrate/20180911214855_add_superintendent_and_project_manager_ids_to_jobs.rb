class AddSuperintendentAndProjectManagerIdsToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :superintendent_id, :integer
    add_column :jobs, :project_manager_id, :integer
  end
end

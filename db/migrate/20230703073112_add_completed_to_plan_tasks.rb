class AddCompletedToPlanTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :plan_tasks, :completed, :boolean, default: false
  end
end

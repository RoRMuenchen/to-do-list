class SetDefaultValuesForTasks < ActiveRecord::Migration[5.0]
  def change
  	Task.where(done:nil).update_all(done: false)
  	change_column_null :tasks, :done, false
	change_column_default :tasks, :done, from: nil, to: false
  end
end

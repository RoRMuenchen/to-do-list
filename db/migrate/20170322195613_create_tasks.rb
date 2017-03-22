class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :due_date
      t.numeric :priority
      t.boolean :done

      t.timestamps
    end
  end
end

class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :rewards do |t|
      t.string :title
      t.text :message
      t.numeric :priority

      t.timestamps
    end

    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :due_date
      t.numeric :priority
      t.boolean :done

      t.timestamps
    end

    add_reference :tasks, :reward

  end
end

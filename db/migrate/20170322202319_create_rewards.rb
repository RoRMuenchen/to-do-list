class CreateRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :rewards do |t|
      t.string :title
      t.text :message
      t.numeric :priority

      t.timestamps
    end
  end
end

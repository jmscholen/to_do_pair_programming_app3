class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :task_name
      t.string :task_description
      t.boolean :complete, default: false
      t.date :due_date
      t.integer :assignee_id

      t.timestamps
    end
  end
end

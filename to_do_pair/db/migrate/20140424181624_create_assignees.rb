class CreateAssignees < ActiveRecord::Migration
  def change
    create_table :assignees do |t|
      t.string :assignee_name

      t.timestamps
    end
  end
end

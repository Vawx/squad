class ReplaceBugsTasksWithIssues < ActiveRecord::Migration
  def change
    drop_table :bugs
    drop_table :tasks

    create_table :issues do |t|
      t.column :profile_id, :integer
      t.column :project_id, :integer
      t.column :status, :string
      t.column :type, :string

      t.timestamps null: false
    end
  end
end

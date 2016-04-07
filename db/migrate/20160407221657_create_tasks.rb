class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.column :profile_id, :integer
      t.column :project_id, :integer
      t.column :status, :string
      t.timestamps null: false
    end
  end
end

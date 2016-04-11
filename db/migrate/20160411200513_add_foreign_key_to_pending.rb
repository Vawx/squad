class AddForeignKeyToPending < ActiveRecord::Migration
  def change
    add_column :pending_invites, :project_id, :integer
  end
end

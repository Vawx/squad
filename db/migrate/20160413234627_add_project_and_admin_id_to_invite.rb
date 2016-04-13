class AddProjectAndAdminIdToInvite < ActiveRecord::Migration
  def change
    add_column :pending_invites, :admin_id, :integer
  end
end

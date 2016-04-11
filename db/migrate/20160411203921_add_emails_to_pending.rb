class AddEmailsToPending < ActiveRecord::Migration
  def change
    add_column :pending_invites, :invite_email, :string
    add_column :pending_invites, :sent_email, :string
  end
end

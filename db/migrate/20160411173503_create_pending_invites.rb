class CreatePendingInvites < ActiveRecord::Migration
  def change
    create_table :pending_invites do |t|
      t.column :invite_email, :string
      t.column :from_email, :string

      t.timestamps, null: false
    end
  end
end

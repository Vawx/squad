class CreateProfile < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true
      t.column :user_name, :string
      t.timestamps
    end
  end
end

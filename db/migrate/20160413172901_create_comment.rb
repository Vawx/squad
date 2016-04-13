class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :content, :string
      t.column :author_id, :string
      t.column :issue_id, :integer

      t.timestamps null: false
    end
  end
end

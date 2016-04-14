class AddAuthorIdToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :author_id, :string
  end
end

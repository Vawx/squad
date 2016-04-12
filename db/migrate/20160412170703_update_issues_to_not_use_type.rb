class UpdateIssuesToNotUseType < ActiveRecord::Migration
  def change
    remove_column :issues, :type
    add_column :issues, :issue_type, :string
  end
end

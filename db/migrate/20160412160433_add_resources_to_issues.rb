class AddResourcesToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :resources, :string
  end
end

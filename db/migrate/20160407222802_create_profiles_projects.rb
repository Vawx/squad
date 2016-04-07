class CreateProfilesProjects < ActiveRecord::Migration
  def change
    create_table :profiles_projects do |t|
      t.integer :profile_id
      t.integer :project_id
    end

    add_index :profiles_projects, :profile_id
    add_index :profiles_projects, :project_id
  end
end

class AddTeamToNewprojects < ActiveRecord::Migration
  def change
    add_column :newprojects, :team, :boolean
  end
end

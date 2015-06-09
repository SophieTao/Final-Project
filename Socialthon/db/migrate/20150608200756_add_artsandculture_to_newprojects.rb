class AddArtsandcultureToNewprojects < ActiveRecord::Migration
  def change
    add_column :newprojects, :artsandculture, :boolean
  end
end

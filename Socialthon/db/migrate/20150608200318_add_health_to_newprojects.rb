class AddHealthToNewprojects < ActiveRecord::Migration
  def change
    add_column :newprojects, :health, :boolean
  end
end

class AddEducationToNewprojects < ActiveRecord::Migration
  def change
    add_column :newprojects, :education, :boolean
  end
end

class AddBusinessToNewprojects < ActiveRecord::Migration
  def change
    add_column :newprojects, :business, :boolean
  end
end

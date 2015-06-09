class AddPovertyToNewprojects < ActiveRecord::Migration
  def change
    add_column :newprojects, :poverty, :boolean
  end
end

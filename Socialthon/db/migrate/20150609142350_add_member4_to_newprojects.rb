class AddMember4ToNewprojects < ActiveRecord::Migration
  def change
    add_column :newprojects, :member4, :string
  end
end

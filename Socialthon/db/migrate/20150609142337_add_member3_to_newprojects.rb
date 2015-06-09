class AddMember3ToNewprojects < ActiveRecord::Migration
  def change
    add_column :newprojects, :member3, :string
  end
end

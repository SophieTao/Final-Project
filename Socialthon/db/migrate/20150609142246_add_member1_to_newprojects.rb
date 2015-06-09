class AddMember1ToNewprojects < ActiveRecord::Migration
  def change
    add_column :newprojects, :member1, :string
  end
end

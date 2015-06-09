class AddMember2ToNewprojects < ActiveRecord::Migration
  def change
    add_column :newprojects, :member2, :string
  end
end

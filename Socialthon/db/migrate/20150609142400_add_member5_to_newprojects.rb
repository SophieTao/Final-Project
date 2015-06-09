class AddMember5ToNewprojects < ActiveRecord::Migration
  def change
    add_column :newprojects, :member5, :string
  end
end

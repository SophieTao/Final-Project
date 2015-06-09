class AddFoodsecurityToNewprojects < ActiveRecord::Migration
  def change
    add_column :newprojects, :foodsecurity, :boolean
  end
end

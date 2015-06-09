class AddUrlToNewprojects < ActiveRecord::Migration
  def change
    add_column :newprojects, :url, :string
  end
end

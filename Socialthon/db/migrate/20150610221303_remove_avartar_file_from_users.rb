class RemoveAvartarFileFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :avatar_file_size
  end
end

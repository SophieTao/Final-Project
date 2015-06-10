class RemoveAvatarFromUsers < ActiveRecord::Migration
    def up
    remove_column :users, :avatar_file_name
  end
end

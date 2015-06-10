class RemoveAvatarContentFromUsers < ActiveRecord::Migration
    def up
    remove_column :users, :avatar_content_type
  end
end

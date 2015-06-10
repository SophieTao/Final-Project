class RemoveAvatarUpdateFromUsers < ActiveRecord::Migration
 def up
    remove_column :users, :avatar_updated_at
  end
end

class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :categorytext
      t.references :user, index: true, foreign_key: true
      t.references :newproject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

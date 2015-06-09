class CreateHealths < ActiveRecord::Migration
  def change
    create_table :healths do |t|

      t.timestamps null: false
    end
  end
end

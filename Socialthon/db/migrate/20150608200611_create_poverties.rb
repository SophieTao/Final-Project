class CreatePoverties < ActiveRecord::Migration
  def change
    create_table :poverties do |t|

      t.timestamps null: false
    end
  end
end

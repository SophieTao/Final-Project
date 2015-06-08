class CreateNewprojects < ActiveRecord::Migration
  def change
    create_table :newprojects do |t|
      t.string :creator
      t.string :title
      t.string :category
      t.text :description
      t.boolean :public
      t.boolean :individual
      t.string :email
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

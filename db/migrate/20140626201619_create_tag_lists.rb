class CreateTagLists < ActiveRecord::Migration
  def change
    create_table :tag_lists do |t|
      t.integer :image_id, null: false
      t.integer :tag_id, null: false

      t.timestamps null: false
    end

    add_index :tag_lists, [:image_id, :tag_id], unique: true 
  end
end

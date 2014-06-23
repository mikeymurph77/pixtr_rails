class CreateCommentClass < ActiveRecord::Migration
  def change
    create_table :comments do |t|
	    t.string :body, null: false
	    t.integer :image_id
	    t.integer :user_id

    	t.timestamps
    end

	    add_index :comments, :image_id
	    add_index :comments, :user_id
   end
end

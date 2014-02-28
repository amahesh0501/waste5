class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :youtube_id
      t.string :text
      t.string :description
      t.integer :seconds

      t.timestamps
    end
  end
end

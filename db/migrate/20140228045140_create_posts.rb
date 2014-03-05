class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :youtube_id
      t.string :title
      t.text :description
      t.text :comedian_name
      t.datetime :date
      t.integer :view_count
      t.integer :duration
      t.integer :rating

      t.timestamps
    end
  end
end

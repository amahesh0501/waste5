class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :comedian
      t.string :youtube_id
      t.string :title
      t.text :description
      t.datetime :date
      t.integer :view_count
      t.integer :duration
      t.integer :rating
      t.string :category
      t.string :image_url
      t.boolean :revoked, default: false

      t.timestamps
    end
  end
end

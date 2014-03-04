class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :youtube_id
      t.string :title
      t.string :description
      t.text :comedian_name
      t.text :date

      t.timestamps
    end
  end
end

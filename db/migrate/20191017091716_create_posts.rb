class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :name
      t.text :content
      t.string :image_name

      t.timestamps
    end
  end
end

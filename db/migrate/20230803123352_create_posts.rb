class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :genre
      t.text :about
      t.string :image

      t.timestamps
    end
  end
end
class AddImageToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :image, :string
  end
end

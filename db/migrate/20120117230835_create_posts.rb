class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :o_id
      t.string :title
      t.text :body
      t.references :author
      t.boolean :allow_comments
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end

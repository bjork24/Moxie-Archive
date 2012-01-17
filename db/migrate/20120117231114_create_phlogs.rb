class CreatePhlogs < ActiveRecord::Migration
  def self.up
    create_table :phlogs do |t|
      t.integer :o_id
      t.string :title
      t.text :body
      t.string :thumbnail
      t.string :photographer
      t.references :author
      t.timestamps
    end
  end

  def self.down
    drop_table :phlogs
  end
end

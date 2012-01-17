class AddTableCategoriesPosts < ActiveRecord::Migration
  def self.up
     create_table :categories_posts, :id => false do |t|
       t.references :category, :null => false
       t.references :post, :null => false
     end

     add_index(:categories_posts, [:category_id, :post_id], :unique => true)
   end

   def self.down
     drop_table :categories_posts
   end
end

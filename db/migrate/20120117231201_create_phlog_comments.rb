class CreatePhlogComments < ActiveRecord::Migration
  def self.up
    create_table :phlog_comments do |t|
      t.string :author
      t.text :body
      t.references :phlog
      t.timestamps
    end
  end

  def self.down
    drop_table :phlog_comments
  end
end

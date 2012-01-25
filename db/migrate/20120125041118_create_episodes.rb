class CreateEpisodes < ActiveRecord::Migration
  def self.up
    create_table :episodes do |t|
      t.string :title
      t.text :body
      t.text :embed
      t.string :thumbnail
      t.text :credits
      t.string :backup
      t.timestamps
    end
  end

  def self.down
    drop_table :episodes
  end
end

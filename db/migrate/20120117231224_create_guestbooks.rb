class CreateGuestbooks < ActiveRecord::Migration
  def self.up
    create_table :guestbooks do |t|
      t.string :author
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :guestbooks
  end
end

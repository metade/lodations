class CreateRecommendations < ActiveRecord::Migration
  def self.up
    create_table :recommendations do |t|
      t.integer :canned_query_id
      t.integer :source_id
      t.integer :destination_id
      t.string :message
      
      t.timestamps
    end
  end

  def self.down
    drop_table :recommendations
  end
end

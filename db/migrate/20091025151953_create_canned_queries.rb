class CreateCannedQueries < ActiveRecord::Migration
  def self.up
    create_table :canned_queries do |t|
      t.integer :idea_id
      t.integer :endpoint_id
      
      t.string :title
      t.string :sparql
      t.string :template
      t.string :variables

      t.timestamps
    end
  end

  def self.down
    drop_table :canned_queries
  end
end

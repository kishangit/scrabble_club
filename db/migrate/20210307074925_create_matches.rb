class CreateMatches < ActiveRecord::Migration[6.0]
  def self.up
    create_table :matches do |t|
      t.integer :player_one
      t.integer :player_two
      t.integer :winner
      t.integer :loser
      t.integer :player_one_score
      t.integer :player_two_score
      t.string  :place

      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end

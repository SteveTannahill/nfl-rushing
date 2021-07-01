class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :team
      t.string :pos
      t.decimal :att_g
      t.integer :att
      t.integer :yds
      t.decimal :avg
      t.decimal :yds_g
      t.integer :td
      t.integer :lng
      t.string :lng_t
      t.integer :rfd
      t.decimal :rfdp
      t.integer :rush20
      t.integer :rush40
      t.integer :fum

      t.timestamps
    end
  end
end

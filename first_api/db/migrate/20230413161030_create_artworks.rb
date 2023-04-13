class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.text :title, null: false
      t.text :img_url, null: false
      t.bigint :artist_id, null: false

      t.timestamps
    end
    add_index :artworks, :img_url, unique: true
    add_index :artworks, [:artist_id, :title], unique: true #can composite indexes ever not be unique?
    #add composite index for artist_id and title, avoid duplicate indexes
  end
end

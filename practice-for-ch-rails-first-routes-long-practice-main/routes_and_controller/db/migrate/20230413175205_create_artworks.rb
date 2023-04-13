class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.bigint :artist_id, null: false

      t.timestamps
    end

    add_index :artworks, :image_url, unique: true
    add_foreign_key :artworks, :users, column: :artist_id
  end
end

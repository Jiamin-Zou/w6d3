class AddIndexesForArtworkShares < ActiveRecord::Migration[7.0]
  def change
    add_index :artwork_shares, :artwork_id
    add_index :artwork_shares, :viewer_id
    add_foreign_key :artwork_shares, :artworks, column: :artwork_id
    add_foreign_key :artwork_shares, :users, column: :viewer_id
    
  end
end

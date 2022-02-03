class ChangeArtworkShares < ActiveRecord::Migration[5.2]
  def change
    change_column :artwork_shares, :artwork_id, :integer, index: true, unique: false
    change_column :artwork_shares, :viewer_id, :integer, index: true, unique: false
  end
end

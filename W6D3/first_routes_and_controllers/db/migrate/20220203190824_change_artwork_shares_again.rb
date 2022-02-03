class ChangeArtworkSharesAgain < ActiveRecord::Migration[5.2]
  def change
    remove_column :artwork_shares, :artwork_id
    remove_column :artwork_shares, :viewer_id
    add_column :artwork_shares, :artwork_id, :integer, index: true
    add_column :artwork_shares, :viewer_id, :integer, index: true
  end
end

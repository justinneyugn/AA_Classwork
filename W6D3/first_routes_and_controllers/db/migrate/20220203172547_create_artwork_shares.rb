class CreateArtworkShares < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, null:false, index: {unique: true}
      t.integer :viewer_id, null:false, index: {unique: true}
      t.timestamps
    end
  end
end

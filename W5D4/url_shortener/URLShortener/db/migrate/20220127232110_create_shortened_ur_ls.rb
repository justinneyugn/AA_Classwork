class CreateShortenedUrLs < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_ur_ls do |t|
      t.string :long_url, null: false 
      t.string :short_url, null: false 
      t.integer :user_id, null: false
    end
    add_index :shortened_ur_ls :long_url, :short_url, unique: true 
  end
end

class Artwork < ApplicationRecord
  validates :index_artworks_on_artist_id_and_title, uniqueness: true, presence: true
  validates :title, :image_url, :artist_id, presence: true


  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :shared_artworks,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare
end
class User < ApplicationRecord

  has_many :artwork,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork

  has_many :shared_artworks,
      primary_key: :id,
      foreign_key: :viewer_id,
      class_name: :ArtworkShare
end

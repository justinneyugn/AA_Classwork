class User < ApplicationRecord

  has__many :artwork,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork
end

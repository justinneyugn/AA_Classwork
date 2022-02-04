# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# to print all of a Artwork class run: rails runner 'p Artwork.all'
#
ActiveRecord::Base.transaction do
    User.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('users')
    user1 = User.create!(username: 'CJ')
    user2 = User.create!(username: 'Flarnie')
    user3 = User.create!(username: 'Jeff')
    user4 = User.create!(username: 'Georges St. Pierre')
    user5 = User.create!(username: 'Ned')

    Artwork.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('artworks')
    artwork1 = Artwork.create!(title: 'Ruby Magic', artist_id: user5.id, image_url: 'https://i.guim.co.uk/img/media/c26ced2bb6cbf1e770623712c0b02e1a5b024edd/0_0_4728_2837/master/4728.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=d6f720e62a15193ebd4fc0a6cd9ecaff
        ' )
    artwork2 = Artwork.create!(title: 'Ruby, cats and lasers', artist_id: user5.id, image_url: 'https://i.guim.co.uk/imgg/media/c26ced2bb6cbf1e770623712c0b02e1a5b024edd/0_0_4728_2837/master/4728.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=d6f720e62a15193ebd4fc0a6cd9ecaff
        ')

    ArtworkShare.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('artwork_shares')
    # ArtworkShare.create!(viewer_id: user3.id, artwork_id: artwork1.id)
    ArtworkShare.create!(viewer_id: user3.id, artwork_id: artwork2.id)
    ArtworkShare.create!(viewer_id: user1.id, artwork_id: artwork2.id)
    ArtworkShare.create!(viewer_id: user2.id, artwork_id: artwork2.id)
end

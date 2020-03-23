# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do

    User.destroy_all
    Artwork.destroy_all
    ArtworkShare.destroy_all

    user1 = User.create!(
        username: "username1"
    )
    
    user2 = User.create!(
        username: "username2"
    )
    
    user3 = User.create!(
        username: "username3"
    )

    painting1 = Artwork.create!(
        title: "painting1",
        image_url: "url1",
        artist_id: user1.id
    )

    painting2 = Artwork.create!(
        title: "painting2",
        image_url: "url2",
        artist_id: user2.id
    )

    painting3 = Artwork.create!(
        title: "painting3",
        image_url: "url3",
        artist_id: user3.id
    )

    painting4 = Artwork.create!(
        title: "painting4",
        image_url: "url4",
        artist_id: user3.id
    )

    shares1 = ArtworkShare.create!(
        artwork_id: painting1.id,
        viewer_id: user3.id
    )

    shares2 = ArtworkShare.create!(
        artwork_id: painting2.id,
        viewer_id: user1.id
    )

    shares3 = ArtworkShare.create!(
        artwork_id: painting4.id,
        viewer_id: user2.id
    )

end
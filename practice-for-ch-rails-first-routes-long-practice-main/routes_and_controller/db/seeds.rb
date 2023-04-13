# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

sean = User.create!(username: 'Sean M')
jiamin = User.create!(username: 'Jiamin Z')
kyle = User.create!(username: 'Kyle G')
kin = User.create!(username: 'Kin Ka T')
van_gogh = User.create!(username: 'Van G')

starry_night = Artwork.create!(title: 'Starry Night', image_url: 'starry_night.png', artist_id: van_gogh.id)
perfect_drawing = Artwork.create!(title: 'The best drawing ever!', image_url: 'best_pic.jpeg', artist_id: jiamin.id)
cool_frog_gif = Artwork.create!(title: 'Cool Frog', image_url: 'cool_frog.gif', artist_id: sean.id)

share1 = ArtworkShare.create!(artwork_id: starry_night.id, viewer_id: kyle.id)
share2 = ArtworkShare.create!(artwork_id: cool_frog_gif.id, viewer_id: van_gogh.id)
share3= ArtworkShare.create!(artwork_id: perfect_drawing.id, viewer_id: kin.id)
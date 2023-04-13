# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# users = User.create([{name: "Merve", email: "merve@merve.merve"},{name: "Carve", email: "carve@carve.carve"}])

carve = User.create!(username: 'carve')
merve = User.create!(username: 'merve')
saturn = User.create!(username: 'saturn')
venus = User.create!(username: 'venus')
mars = User.create!(username: 'mars')
earth = User.create!(username: 'earth')


sunset = Artwork.create!(title: "Sunset", img_url: "http://instagram.com", artist_id: merve.id)
giraffe = Artwork.create!(title: "Giraffe", img_url: "http://instagram1.com", artist_id: merve.id)
sadness = Artwork.create!(title: "Sadness", img_url: "http://instagram2.com", artist_id: saturn.id)
banksy = Artwork.create!(title: "Banksy", img_url: "http://instagram3.com", artist_id: carve.id)
fire_of_sun = Artwork.create!(title: "Fire of Sun", img_url: "http://instagram4.com", artist_id: venus.id)


ArtworkShare.create!(artwork_id: sunset.id, viewer_id: mars.id)
ArtworkShare.create!(artwork_id: giraffe.id, viewer_id: merve.id)
ArtworkShare.create!(artwork_id: fire_of_sun.id, viewer_id: merve.id)
ArtworkShare.create!(artwork_id: sadness.id, viewer_id: carve.id)
ArtworkShare.create!(artwork_id: banksy.id, viewer_id: earth.id)
ArtworkShare.create!(artwork_id: sunset.id, viewer_id: venus.id)
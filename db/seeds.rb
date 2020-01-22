

Artist.destroy_all
Commissioner.destroy_all
Mural.destroy_all

artist_one = Artist.create(name: "JC Rivera")
artist_two = Artist.create(name: "Frillz")

commissioner_one = Commissioner.create(name: "City of Chicago")

 Mural.create(artist: artist_one, commissioner: commissioner_one, zip: 60642, year_installed: 1971)


puts "hello world"
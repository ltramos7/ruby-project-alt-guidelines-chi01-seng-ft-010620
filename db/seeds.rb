

Artist.destroy_all
Commissioner.destroy_all
Mural.destroy_all

artist_one = Artist.create(name: "JC Rivera")
artist_two = Artist.create(name: "Frillz")
artist_three = Artist.create(name: "Lillpore")
artist_four = Artist.create(name: "Kozmo")

commissioner_one = Commissioner.create(name: "City of Chicago")
commissioner_two = Commissioner.create(name: "Bill Gates")
commissioner_three = Commissioner.create(name: "William H. Macy")

mural_one = Mural.create(name: "Cool", artist: artist_one, commissioner: commissioner_one, zip: 60642, year_installed: 1971)
mural_two = Mural.create(name: "Nice", artist: artist_four, commissioner: commissioner_one, zip: 60642, year_installed: 1988)
mural_three = Mural.create(name: "Awesome", artist:artist_two, commissioner: commissioner_three, zip: 60625, year_installed: 2020)
mural_four = Mural.create(name: "Yay", artist:artist_two, commissioner: commissioner_one, zip: 60622, year_installed: 2020)
mural_five = Mural.create(name: "Wow", artist:artist_three, commissioner: commissioner_three, zip: 60622, year_installed: 2020)


puts "hello world"
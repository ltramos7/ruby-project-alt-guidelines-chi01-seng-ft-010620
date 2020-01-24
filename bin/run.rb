require_relative '../config/environment'
ActiveRecord::Base.logger = nil

cli = CommandLineInterface.new

cli.greet
puts "-------------------------"
cli.question
puts "-------------------------"
cli.artist_commissioners
puts "-------------------------"
cli.find_murals_by_zip 
puts "-------------------------"
cli.find_locations_of_artist_murals
puts "-------------------------"
cli.commissioners_artists 
puts "-------------------------"
cli.create_artist
puts "-------------------------"
cli.create_commissioner
puts "-------------------------"
cli.update_installment_year
puts "-------------------------"
cli.mural_no_longer_commissioned








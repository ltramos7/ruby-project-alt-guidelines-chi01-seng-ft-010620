require_relative '../config/environment'

cli = CommandLineInterface.new
cli.greet
cli.question
cli.handle_artist_commissioners
cli.find_murals_by_zip 
cli.find_locations_of_artist_murals






# puts "Do you like artist? Yes or no"
# answer = gets.chomp

# if answer == "Yes"
#     puts "Great"
# else
#     puts "This won't be fun for you."
# end


puts "hello world"

class CommandLineInterface

    def greet
        puts 'Welcome to Chicago Art Hunter!'
    end

    def question
        puts "Do you like artists? Y or N"
        answer = gets.chomp

        if answer == "Y"
            puts "Great"
        else
            puts "This won't be fun for you."
        end
    end

    def handle_artist_commissioners
        puts "We can find the commissioners that supported an artist."
        puts "Please type an artist from the list below:"

        Artist.all.map do |artist|
           puts artist.name
        end

        artist_selected = gets.chomp
        artist = Artist.find_by(name: artist_selected)

        puts "Here are the commissioners that supported #{artist_selected}:"

        artist.commissioners.map do |commissioner|
            puts commissioner.name
        end
    end

    def find_murals_by_zip
        puts "We can find the amount of murals in a particular zipcode."
        puts "Please enter a zip code:"
        zipcode = gets.chomp
      
        murals = Mural.all.select do |mural|
            mural.zip == zipcode.to_i
        
        end

        puts murals.count
    end

    def find_locations_of_artist_murals
        #will want gets.chomp but after I get the code right
        puts "We can find the mural locations of an artist."
        puts "Please select an artist below to find their mural locations:"
        Artist.all.map do |artist|
           puts artist.name
        end
        artist_selected = gets.chomp

        artist = Artist.find_by(name: artist_selected)

        artist.murals.map do |mural|
            puts mural.zip
        end

    end

    ##-----Will try this later. I don't have great data to play with this yet------#
    # def mural_installation_year
    #     puts Mural.all

    #     Mural.all.map do |mural|
    #         puts  mural.year_installed
    #     end

    # end
    


   
end
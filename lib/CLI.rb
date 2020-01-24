class CommandLineInterface

    def greet
        puts 'Welcome to Chicago Art Hunter!'
    end

    def question
        puts "Do you like artists? Yes or No"
        answer = gets.chomp

            if answer == "Yes"
                puts "Great"
            elsif answer == "No"
                puts "This won't be fun for you."
            else
                puts "Please type Yes or No."
                self.question
            end
    end

    def artist_commissioners
        puts "We can find the commissioners that supported an artist."
        puts "Please type an artist from the list below:"

        Artist.all.map do |artist|
           puts artist.name
        end

        artist_selected = gets.chomp
        artist = Artist.find_by(name: artist_selected)

        # if artist == artist_selected
        if  artist = Artist.find_by(name: artist_selected)

            puts "Here are the commissioners that supported #{artist_selected}:"

            artist.commissioners.map do |commissioner|
                puts commissioner.name
            end

        else
            puts "Please type a name from above again."
            self.artist_commissioners
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

        if artist = Artist.find_by(name: artist_selected)

            artist.murals.map do |mural|
                puts mural.zip
            end
        else
            puts "Please type in the artist again."
            self.find_locations_of_artist_murals
        end

    end

    def commissioners_artists
        puts "We can find all of the artist a commissioner supported."
        puts "Please select a commissioner from the list below to see the artists they've commissioned:"

        Commissioner.all.map do |commissioner|
        puts commissioner.name
        end

        commissioner_selected = gets.chomp

        if commissioner = Commissioner.find_by(name: commissioner_selected)

            commissioner.artists.map do |artist|
                puts artist.name
            end
        else
            puts "Please type the name again."
            self.murals_of_a_commissioner
        end
    end


    def create_artist
        puts "A new artist is on the scene. Let's add them!"
        puts "Please type in their name."
        new_artist = gets.chomp
        Artist.create(name: new_artist)
        puts "You've added a new artist to the scene!"
        Artist.all.map do |artist|
            puts artist.name
        end
    end

    def create_commissioner
        puts "Somebody has enough money to commission some art. Let's add them to the commissioner's list!"
        puts "Please type in their name."
        new_commissioner = gets.chomp
        Commissioner.create(name: new_commissioner)
        puts "You've added a new commissioner to the scene!"
        Commissioner.all.map do |commissioner|
            puts commissioner.name
        end
    end

    def update_installment_year

        puts "You found out the year of installment of a mural is wrong. Let's update it"
        puts "Please select the id to update it's installment year."
        #I need to match up the incorrect year with the year in the database
        Mural.all.map do |mural|
            puts mural.id
            puts mural.year_installed
        end

        mural_id = gets.chomp

        if mural = Mural.find_by(id: mural_id)
            puts "Please enter the year of the correct installment year."
        end
        correct_year = gets.chomp
    
        
        mural.update(year_installed: correct_year)

        puts "Mural #{mural.id} installment year is now #{mural.year_installed}"
        # puts mural.year_installed
    end

    def mural_no_longer_commissioned
        
        puts "You found out that a commissioner is dropping out of supporing a mural. Now we have to cancel the mural project. Bummer"
        puts "Enter the horrible commissoner's name:"

        Commissioner.all.map do |commissioner|
            puts commissioner.name
        end

        commissioner_selected = gets.chomp

        if commissioner = Commissioner.find_by(name: commissioner_selected)
            puts "Please select the mural id that is no longer commissioned."
            # commissioner
        else
            puts "That was not a valid option. Please type the name again."
            self.mural_no_longer_commissioned
        end

        commissioner.murals.map do |mural|
            puts mural.id
        end

        mural_selected = gets.chomp
        puts mural_selected.to_i
        
        if mural = Mural.find_by(id: mural_selected)
            mural.destroy
        end

        # mural_selected.destroy

        # Mural.all.map do |mural|
        #     puts mural.id
            
        # end


    
    end



    ##-----Will try this later. I don't have great data to play with this yet------#
    # def mural_installation_year
    #     puts Mural.all

    #     Mural.all.map do |mural|
    #         puts  mural.year_installed
    #     end

    # end
    


   
end
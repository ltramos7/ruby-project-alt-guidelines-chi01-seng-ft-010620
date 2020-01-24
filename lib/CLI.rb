class CommandLineInterface

    def greet
        puts 'Welcome to Chicago Art Hunter!'
        puts "\n"
    end

    def question
        puts "Do you like artists? Yes or No"
        answer = gets.chomp

            if answer == "Yes"
                puts "Great"
                puts "\n"
            elsif answer == "No"
                puts "This won't be fun for you."
                puts "\n"
            else
                puts "Please type Yes or No."
                puts "\n"
                self.question
            end
    end

    def artist_commissioners
        system "clear"

        puts "We can find the commissioners that supported an artist."
        puts "Please type an artist from the list below:"
        
        puts "\n"

        Artist.all.map do |artist|
           puts artist.name
        end
       
        artist_selected = gets.chomp
        artist = Artist.find_by(name: artist_selected)


        if  artist = Artist.find_by(name: artist_selected)

            puts "Here are the commissioners that supported #{artist_selected}:"
            puts "\n"
            artist.commissioners.map do |commissioner|
                puts commissioner.name
                puts "\n"
            end
            
        elsif
            puts "Please type the name of the artist again."
        else
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
        puts "\n"
    end

    def find_locations_of_artist_murals
        
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
            self.find_locations_of_artist_murals
        end
        puts "\n"
    end

    def commissioners_artists
        
        puts "We can find all of the artists a commissioner supported."
        puts "Please select a commissioner from the list below to see the artists they've commissioned:"

        Commissioner.all.map do |commissioner|
        puts commissioner.name
        end

        puts "\n"

        commissioner_selected = gets.chomp

        if commissioner = Commissioner.find_by(name: commissioner_selected)

            commissioner.artists.map do |artist|
                puts artist.name
            end
        else
            self.commissioners_artists
        end
        puts "\n"
    end


    def create_artist
        
        puts "A new artist is on the scene. Let's add them!"
        puts "Please type in their name."

        puts "\n"

        new_artist = gets.chomp

        puts "\n"

        if Artist.all.map { |artist| artist.name }.include?(new_artist)
            puts "Artist already exits!"
        else
            Artist.create(name: new_artist)
            puts "You've added a new artist to the scene!"
            Artist.all.map do |artist|
                puts artist.name
            end
        end
        puts "\n"
    end

    def create_commissioner
        
        puts "Somebody has enough money to commission some art. Let's add them to the commissioner's list!"

        puts "\n"

        puts "Please type in their name."

        puts "\n"

        new_commissioner = gets.chomp

        puts "\n"

        Commissioner.create(name: new_commissioner)
        puts "You've added a new commissioner to the scene!"
        Commissioner.all.map do |commissioner|
            puts commissioner.name
        end
        puts "\n"
    end

    def update_installment_year
        
        puts "You found out the year of installment of a mural is wrong. Let's update it"
        puts "Please select the name to update it's installment year."

        puts "\n"
       
        Mural.all.map do |mural|
            puts mural.name
            puts mural.year_installed
        end

        mural_name = gets.chomp

        if mural = Mural.find_by(name: mural_name)
            puts "Please enter the year of the correct installment year."
        end
        correct_year = gets.chomp
    
        mural.update(year_installed: correct_year)

        puts "\n"

        puts "Mural #{mural.name} installment year is now #{mural.year_installed}."
        
        puts "\n"
    end

    def mural_no_longer_commissioned
        
        puts "You found out that a commissioner is dropping out of supporing a mural. Now we have to cancel the mural project. Bummer"
        puts "Enter the horrible commissoner's name:"

        puts "\n"

        Commissioner.all.map do |commissioner|
            puts commissioner.name
        end

        commissioner_selected = gets.chomp

        if commissioner = Commissioner.find_by(name: commissioner_selected)
            puts "Please select the mural name that is no longer commissioned."
            puts "------------------------------------"
        else
            puts "That was not a valid option. Please type the name again."
            self.mural_no_longer_commissioned
        end

        commissioner.murals.map do |mural|
            puts mural.name
        end
        puts "------------------------------------"

        mural_selected = gets.chomp

        Mural.find_by(name: mural_selected).destroy

        puts "\n"

        puts "Mural #{mural_selected} is no longer commissioned."

        puts "\n"


        commissioner.murals.map do |mural|
            puts mural.name
        end
        
    end

    def user_done
        system "clear"
        puts "Thank you for learning about Chicago Artists!"
    end


    def let_user_choose
       
        puts "Please selected a number for the option you want."
        puts "1. Find the commissioners of an artist."
        puts "2. Find how many murals are in a given zipcode."
        puts "3. Find the zipcodes where an artist's murals are located"
        puts "4. Find the artists that a commissioner has supported."
        puts "5. Add an artist to the scene."
        puts "6. Add a commissioner to the commissioners list."
        puts "7. Update the installment year of a mural."
        puts "8. Cancel a mural"
        puts "9. Done."


        user_choice = gets.chomp

        case user_choice
        when "1"
            artist_commissioners
            self.let_user_choose
        when "2"
            find_murals_by_zip
            self.let_user_choose
        when "3"
            find_locations_of_artist_murals
            self.let_user_choose
        when "4"
            commissioners_artists
            self.let_user_choose
        when "5"
            create_artist
            self.let_user_choose
        when "6"
            create_commissioner
            self.let_user_choose
        when "7"
            update_installment_year
            self.let_user_choose
        when "8"
            mural_no_longer_commissioned
            self.let_user_choose
        when "9"
            user_done
        end
        
    end


end
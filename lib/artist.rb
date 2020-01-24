class Artist < ActiveRecord::Base
    has_many :murals
    has_many :commissioners, through: :murals


    # def mural_location
    #     #should be able to enter the artist (available from the database) and get the the zip code of all of the murals of the artist
    
    # end
# murals.artist.60647

# Frillz.murals.find_by(zip: 60647)
    

    # def supporting_commissioners
    #     # I should be able to find all of the commissoners for an artist
    #     # self.find_by(name: "City of Chicago")
    #     self.murals.map do |m|
    #         m.commissioner_id
    #     end
    # end

end
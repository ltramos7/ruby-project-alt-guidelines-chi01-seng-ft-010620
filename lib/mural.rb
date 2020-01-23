class Mural < ActiveRecord::Base
    belongs_to :artist
    belongs_to :commissioner

    # def murals_nearyby(zipcode)
    #     #as a user I should be able to find art by zipcode
    #     # As a user I want to find murals based on a location so I can find art near that location. (by street name or zip code? Probably zip code)
    # end



end



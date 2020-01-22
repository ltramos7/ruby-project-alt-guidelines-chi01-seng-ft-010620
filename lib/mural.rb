class Mural < ActiveRecord::Base
    belongs_to :artist
    belongs_to :commissioner

    def murals_nearyby(zipcode)
        #as a user I should be able to find art by zipcode
    end



end



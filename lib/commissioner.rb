class Commissioner < ActiveRecord::Base
    has_many :murals
    has_many :artists, through: :murals


    def murals_commissioned
        #as user, I should be able to enter commissioner name (provided since user can only select from database) and get all of the murals that were commissioned by that commissioner
    end

    def supported_artists
        # I should be able to find all of the artists a commissioner supported
    end


end
class Artist < ActiveRecord::Base
    has_many :murals
    has_many :commissioners, through: :murals

end
class Commissioner < ActiveRecord::Base
    has_many :murals
    has_many :artists, through: :murals
end
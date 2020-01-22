class Mural < ActiveRecord::Base
    belongs_to :artist
    belongs_to :commissioner
end
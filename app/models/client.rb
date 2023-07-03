class Client < ApplicationRecord
    has_many :movies
    include PgSearch::Model
end

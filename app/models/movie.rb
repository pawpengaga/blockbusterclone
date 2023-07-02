class Movie < ApplicationRecord
  belongs_to :client, optional: true #Quita el not null


end

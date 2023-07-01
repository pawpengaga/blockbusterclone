class Movie < ApplicationRecord
  belongs_to :client, optional: true #Quita el not null

  def to_s
    self.name
  end
end

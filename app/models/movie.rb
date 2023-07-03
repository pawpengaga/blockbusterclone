class Movie < ApplicationRecord
  belongs_to :client, optional: true #Quita el not null

  include PgSearch::Model #Hace una serie de selects muy sofisticados en la base de datos

  pg_search_scope :search_full_text, against:{
      name: 'A'
  },
  associated_against:{
    client: [:name]
  },
  using: {
      tsearch: {
          prefix: true,
          any_word: true,
          dictionary: 'simple' #cambiar a spanish en algún momento
      }
  }
end

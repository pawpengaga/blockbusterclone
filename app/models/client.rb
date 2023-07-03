class Client < ApplicationRecord
    has_many :movies
    include PgSearch::Model

    pg_search_scope :search_full_text, against:{
        name: 'A'
    },
    using: {
        tsearch: {
            prefix: true,
            any_word: true,
            dictionary: 'simple' #cambiar a spanish en algún momento
        }
    }
end

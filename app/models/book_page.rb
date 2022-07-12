class BookPage < ApplicationRecord
  include PgSearch::Model
  belongs_to :book, inverse_of: :book_pages

  # pg_search_scope :search_body, against: :body

  pg_search_scope :search_body,
    against: { body: 'A'},
    using: {
      tsearch: {
        dictionary: 'english', tsvector_column: 'searchable'
      }
    }
end

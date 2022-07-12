class Book < ApplicationRecord
  has_many :book_pages, inverse_of: :book
end

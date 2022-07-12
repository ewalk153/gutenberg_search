class AddGinSearchableToBookPages < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_index :book_pages, :searchable, using: :gin, algorithm: :concurrently
  end
end

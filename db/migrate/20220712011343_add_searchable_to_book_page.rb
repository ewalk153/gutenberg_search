class AddSearchableToBookPage < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      ALTER TABLE book_pages
      ADD COLUMN searchable tsvector GENERATED ALWAYS AS (
        setweight(to_tsvector('english', coalesce(body, '')), 'A')
      ) STORED;
    SQL
  end

  def down
    remove_column :book_pages, :searchable
  end
end

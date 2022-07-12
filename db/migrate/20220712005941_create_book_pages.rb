class CreateBookPages < ActiveRecord::Migration[7.0]
  def change
    create_table :book_pages do |t|
      t.text :body
      t.integer :page
      t.references :book

      t.timestamps
    end
  end
end

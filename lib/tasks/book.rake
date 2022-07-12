namespace :book do
  desc "imports a booka"
  task import: :environment do
    book = Book.create(
      title: "Price and Prejudice",
      author: "Jane Austin"
    )
    page = 0
    File.open("data/pride-and-prejudice-1342-0.txt").readlines.in_groups_of(50) do |lines|
      book.book_pages.create(
        page: page,
        body: lines.join
      )
      page += 1
    end
  end

  desc "erase all books"
  task reset: :environment do
    raise "pass CONFIRM=true to this task to proceed with destroy all books" unless ENV['CONFIRM']=='true'

    Book.destroy_all
    BookPage.destroy_all
  end

end

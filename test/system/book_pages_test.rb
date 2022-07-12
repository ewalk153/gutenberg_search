require "application_system_test_case"

class BookPagesTest < ApplicationSystemTestCase
  setup do
    @book_page = book_pages(:one)
  end

  test "visiting the index" do
    visit book_pages_url
    assert_selector "h1", text: "Book pages"
  end

  test "should create book page" do
    visit book_pages_url
    click_on "New book page"

    fill_in "Body", with: @book_page.body
    click_on "Create Book page"

    assert_text "Book page was successfully created"
    click_on "Back"
  end

  test "should update Book page" do
    visit book_page_url(@book_page)
    click_on "Edit this book page", match: :first

    fill_in "Body", with: @book_page.body
    click_on "Update Book page"

    assert_text "Book page was successfully updated"
    click_on "Back"
  end

  test "should destroy Book page" do
    visit book_page_url(@book_page)
    click_on "Destroy this book page", match: :first

    assert_text "Book page was successfully destroyed"
  end
end

require "test_helper"

class BookPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_page = book_pages(:one)
  end

  test "should get index" do
    get book_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_book_page_url
    assert_response :success
  end

  test "should create book_page" do
    assert_difference("BookPage.count") do
      post book_pages_url, params: { book_page: { body: @book_page.body } }
    end

    assert_redirected_to book_page_url(BookPage.last)
  end

  test "should show book_page" do
    get book_page_url(@book_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_page_url(@book_page)
    assert_response :success
  end

  test "should update book_page" do
    patch book_page_url(@book_page), params: { book_page: { body: @book_page.body } }
    assert_redirected_to book_page_url(@book_page)
  end

  test "should destroy book_page" do
    assert_difference("BookPage.count", -1) do
      delete book_page_url(@book_page)
    end

    assert_redirected_to book_pages_url
  end
end

require "test_helper"

class Api::V1::BooksControllerTest < ActionDispatch::IntegrationTest
  def test_index_response
    get api_v1_books_path#api_v1_books_url

    response = JSON.parse(@response.body)

    assert_response :success
    assert_not_empty(response)
    assert_equal('Hello world', response[0]['name'])
    assert_instance_of(Array,response)
  end

  def test_show_response
    params = books(:one)

    get api_v1_book_url(params)
    assert_response :success
  end

  def test_show_incorrect_response
    book = { id: 4, name: 'hehe', price: 2 }
    get api_v1_book_url(book)
    assert_response :bad_request
  end

  def test_create_book
    book = { book: { id: 4, name: 'hehe', price: 2 } }
    post api_v1_books_path, params: book, as: :json

    assert_response :success
  end

  def test_crete_book_with_wrong_data
    book = { book: { id: 4, name: nil, price: 2 } }
    post api_v1_books_path, params: book, as: :json
    response = JSON.parse(@response.body)

    assert_response :bad_request
    assert_equal 'Error creating book.', response['error'], 'Error in msnj'
  end

  def test_destroy_book
    params = books(:one)
    delete api_v1_book_path(params)

    assert_response :no_content
  end

    def test_destroy_book
    params = books(:one)
    delete api_v1_book_path(params)

    assert_response :no_content
  end

  def test_destroy_wrong_book
    book = { id: 40, name: 'test01', price: 2 }
    delete api_v1_book_path(book)

    assert_response :bad_request
  end
end

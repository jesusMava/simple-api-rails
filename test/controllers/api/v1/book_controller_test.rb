require "test_helper"

class Api::V1::BooksControllerTest < ActionDispatch::IntegrationTest
  # context 'GET #index' do
  def test_index_response
    get api_v1_books_url
    assert_response :success
  end
    # should respond_with(200)
  # end
end

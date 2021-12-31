class Api::V1::BooksController < ApplicationController
  before_action :find_book, only: [:show, :delete]

  def index
    @books = Book.all
    render json: @books, status: 200
  end

  def show
    if @book
      render json: @book, status: 200
    else
      show_error
    end
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: 200
    else
      show_error
    end
  end

  def destroy
    if @book
      @book.destroy
      render json: @book, status: 400
    else
      show_error
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :price)
  end

  def show_error
      render json: {error: 'Not found.'}, status: 400
  end

  def find_book
    @book = Book.find(params[:id])
  end
end

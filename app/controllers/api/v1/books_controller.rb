class Api::V1::BooksController < ApplicationController
  before_action :find_book, only: [:show, :destroy]

  def index
    @books = Book.all
    render json: @books, status: :ok
  end

  def show
    if @book
      render json: @book, status: :ok
    else
      show_error
    end
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :ok
    else
      render json: {error: 'Error creating book.'}, status: :bad_request
    end
  end

  def destroy
    if @book
      @book.destroy
      render status: :no_content
    else
      show_error
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :price)
  end

  def show_error
      render json: {error: 'Not found.'}, status: :bad_request
  end

  def find_book
    @book = Book.find_by(id: params[:id])
  end
end

class BooksController < ApplicationController
  
  def index
    render json: Book.count
  end

  def create
    book_params = {
      author: 'Frank',
      title: 'The Shark'
    }
    book = Book.new(book_params)

    if book.save
      render status: :created
    else
      render status: :unprocessable_entity

    end

  end


end

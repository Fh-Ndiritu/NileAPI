class BooksController < ApplicationController

  def index
    render json: Book.count
  end

  def create
    book = Book.new(book_params)

    if book.save
      render json: book,  status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end

  end

  def destroy
    Book.find(params[:id]).destroy!
    head :no_content
  end



  private 

  def not_destroyed(e)
    render json: { 'errors' => e.erros}, status: :unprocessable_entity
  end

  def book_params
    params.require(:book).permit(:title,  :author)
  end

end

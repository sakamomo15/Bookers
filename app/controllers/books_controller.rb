class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params) #viewはないのでローカル変数
    book.save
    redirect_to '/books/show'
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
    # book => createのローカル変数
  end
  
end

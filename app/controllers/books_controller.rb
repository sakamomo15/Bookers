class BooksController < ApplicationController
  def new
    # indexに移動
  end

  def create
    book = Book.new(book_params) #viewはないのでローカル変数
    book.save
    redirect_to book_path(book.id) #idに対応したshowに遷移するため引数必須
  end

  def index
    @books = Book.all
    @book = Book.new # newから移動
    # showボタン用の定義は、@books |book|からid引っ張れるので
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
    # book => createのローカル変数
  end

end

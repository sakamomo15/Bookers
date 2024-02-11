class BooksController < ApplicationController
  def new
    # indexに移動
  end

  def create
    @book = Book.new(book_params)
    #viewはないのでローカル変数と思いきや,flashのためHTMl変換必要なので@変数
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id) #idに対応したshowに遷移するため引数必須
    else
      @books = Book.all # renderでindexを表示しようとすると@booksの定義がcreateにも必要
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new # newから移動
    # showボタン用の定義は、@books |book|からid引っ張れるので不要
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])

    if @book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    else
      render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
    # book => createのローカル変数
  end

end

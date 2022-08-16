class BooksController < ApplicationController
  protect_from_forgery :except => [:destroy]
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      flash[:success] = 'Book was successfully created.'
      redirect_to @book
    else
      @books = Book.all
      render :index, status: :unprocessable_entity
    end
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
      flash[:success] = 'Book was successfully updated.'
      redirect_to @book
    else
      @books = Book.all
      render :edit, status: :unprocessable_entity
    end
  end  
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:success] = 'Book was successfully destroyed.'
    redirect_to books_path, status: :see_other
  end  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  
end

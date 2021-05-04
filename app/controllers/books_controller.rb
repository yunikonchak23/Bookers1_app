class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    #1.新規登録するためのインスタンス作成
    book = Book.new(book_params)
    #2.データベースに保存するためのsaveメソッド実行
    book.save
    #3.Show画面へリダイレクト
    redirect_to book_path(book.id)
  end

  def edit
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end

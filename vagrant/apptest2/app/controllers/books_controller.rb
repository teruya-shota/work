class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book_user.id = current_user.id
    @book.save
    redirect_to books_path,notice: "You have creatad book successfully."
    end

  def index
    @book_path = Book.all.order(created_at: :desc)
    @teruya = User.find(current_user.id)
    @book = Book.new
  end

  def show
    @book_path = Book.all.order(created_at: :desc)
    @teruya = User.find(current_user.id)
    @book = Book.new(book_params)
  end

  def edit
    @book = Book.find_by(params[:id])
  end

  def update
     @book =Book.find(params[:id])
     if @book.update(book_params)
     redirect_to book_path(@book), notice:"You have updated book successfully."
     else
      render :edit
    end
  end

  def destroy
    book = Book.find_by(params[:id])
    book.destroy
    redirect_to user_path(book.user), notice: "You have destroyed book successfully."
  end

  private

    def book_params
        params.require(:book).permit(:title, :body, :user_id)
    end
end

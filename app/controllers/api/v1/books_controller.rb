
class Api::V1::BooksController < ApplicationController
  def index
    render json: Book.all
  end

  def create
    book = Book.new(book_params)

    if book.save
      render json: book, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Book.find(params[:id]).destroy!

    head :no_content
  end

  def edit
    @article = Article.find(params[:id])
  end

  def updated
    respond_to do |format|
      if @book.update(book_params)
        format.json { render :show, status: :ok, location: @book }
      else
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private 

  def book_params
    params.require(:book).permit(:title, :author, :chapter)
  end
end

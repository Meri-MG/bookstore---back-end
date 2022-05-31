class Api::V1::CommentsController < ApplicationController  
  def index
    comments = Book.find(params[:book_id]).comments;
    render json: comments
  end

  def create
    comment = Comment.new(comments_params)
    comment.book_id = params[:book_id]

    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.book.decrement!(:comments_counter)
    comment.destroy!

    head :no_content
  end

  private

  def comments_params
    params.require(:comment).permit(:text, :book_id)
  end
end

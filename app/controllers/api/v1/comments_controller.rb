class CommentsController < ApplicationController  
  def index
    render json: Comment.all
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
    comment = Comment.find(params[:comment_id])
    comment.book.decrement!(:comments_counter)
    comment.destroy

    head :no_content
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end
end

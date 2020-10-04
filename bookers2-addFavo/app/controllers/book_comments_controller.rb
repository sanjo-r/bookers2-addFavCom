class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:book_id])
    comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    comment.destroy
    redirect_to book_path(book.id)
  end

  private
    def book_comment_params
      params.require(:book_comment).permit(:comment)
    end

end
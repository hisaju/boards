class CommentsController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @comment = @board.comments.build(comment_params)

    if @comment.save
      redirect_to @board, notice: "コメントを投稿しました"
    else
      redirect_to @board, alert: "コメントの投稿に失敗しました"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

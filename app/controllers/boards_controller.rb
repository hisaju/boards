class BoardsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    # Ransackを使って検索機能を実装
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, notice: '掲示板を作成しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @board = find_own_board
  end

  def update
    @board = find_own_board
    if @board.update(board_params)
      redirect_to board_path(@board), notice: '掲示板を更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @board = find_own_board
    @board.destroy
    redirect_to boards_path, notice: '掲示板を削除しました', status: :see_other
  end

  private

  def board_params
    params.require(:board).permit(:title, :content, :image)
  end
  
  def find_own_board
    board = current_user.boards.find_by(id: params[:id])
    if board.nil?
      redirect_to boards_path, alert: 'アクセス権限がありません'
      return
    end
    board
  end
end

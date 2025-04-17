class ChangeUserIdNotNullInBoards < ActiveRecord::Migration[7.2]
  def change
    change_column_null :boards, :user_id, false
  end
end

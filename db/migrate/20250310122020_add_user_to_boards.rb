class AddUserToBoards < ActiveRecord::Migration[7.2]
  def change
    add_reference :boards, :user, foreign_key: true
  end
end

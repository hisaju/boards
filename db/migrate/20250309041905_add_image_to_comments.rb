class AddImageToComments < ActiveRecord::Migration[7.2]
  def change
    add_column :comments, :image, :string
  end
end

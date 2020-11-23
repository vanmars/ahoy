class AddOutlineIdColumnsToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :outline_id_1, :integer
    add_column :boards, :outline_id_2, :integer
  end
end

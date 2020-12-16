class RenameRandomTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :randoms, :random_boards
  end
end

class ChangeBoardsTable < ActiveRecord::Migration[5.2]
  def change
    change_table :boards do |t|
      t.remove :outline_id_1, :outline_id_2
      t.string :outline_id_1
      t.string :outline_id_2
    end
  end
end

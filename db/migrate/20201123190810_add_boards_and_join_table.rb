class AddBoardsAndJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :name
      t.timestamps
    end

    create_table :board_outlines, id: false do |t|
      t.belongs_to :board, index: true
      t.belongs_to :outline, index: true
    end

  end
end

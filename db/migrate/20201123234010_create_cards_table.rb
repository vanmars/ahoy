class CreateCardsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :text
      t.string :type
      t.string :color
      t.integer :board_id
      t.timestamps
    end
  end
end

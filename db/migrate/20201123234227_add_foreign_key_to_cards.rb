class AddForeignKeyToCards < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :cards, :boards
  end
end

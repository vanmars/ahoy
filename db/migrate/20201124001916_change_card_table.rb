class ChangeCardTable < ActiveRecord::Migration[5.2]
  def change

    change_table :cards do |t|
      t.remove :type
      t.string :category
    end

  end
end

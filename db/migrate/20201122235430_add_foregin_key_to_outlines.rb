class AddForeginKeyToOutlines < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :outlines, :users
  end
end

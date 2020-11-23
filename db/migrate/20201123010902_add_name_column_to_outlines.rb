class AddNameColumnToOutlines < ActiveRecord::Migration[5.2]
  def change
    add_column :outlines, :name, :string
  end
end

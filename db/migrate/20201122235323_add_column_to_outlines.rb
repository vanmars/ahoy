class AddColumnToOutlines < ActiveRecord::Migration[5.2]
  def change
      add_column :outlines, :user_id, :integer
  end
end

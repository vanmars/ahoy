class CreateRandom < ActiveRecord::Migration[5.2]
  def change
    create_table :randoms do |t|
      t.string :book_title
      t.timestamps
    end
  end
end

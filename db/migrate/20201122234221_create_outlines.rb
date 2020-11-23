class CreateOutlines < ActiveRecord::Migration[5.2]
  def change
    create_table :outlines do |t|
      t.string :claim_1
      t.string :evidence_1a
      t.string :evidence_1b
      t.string :close_call_1
      t.string :red_herring_1
      t.string :claim_2
      t.string :evidence_2a
      t.string :evidence_2b
      t.string :close_call_2
      t.string :red_herring_2
      t.timestamps()
    end
  end
end

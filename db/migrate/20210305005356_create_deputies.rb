class CreateDeputies < ActiveRecord::Migration[6.0]
  def change
    create_table :deputies do |t|
      t.string :name
      t.integer :deputy_id
      t.string :card_number
      t.string :federal_id
      t.string :state, limit: 2
      t.string :political_party, limit: 2
      t.belongs_to :legislature, null: false, foreign_key: true

      t.timestamps
    end
  end
end

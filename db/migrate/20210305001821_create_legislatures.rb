class CreateLegislatures < ActiveRecord::Migration[6.0]
  def change
    create_table :legislatures do |t|
      t.integer :year

      t.timestamps
    end
  end
end

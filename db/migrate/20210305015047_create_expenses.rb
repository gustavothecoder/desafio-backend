class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.integer :document_number
      t.string :provider
      t.string :federal_id
      t.integer :kind
      t.datetime :issue_date
      t.decimal :document_value
      t.decimal :gloss_value
      t.decimal :net_value
      t.integer :month
      t.integer :year
      t.integer :portion
      t.string :passenger
      t.string :part
      t.string :batch
      t.string :refund
      t.string :restitution
      t.string :document_url
      t.belongs_to :expense_type, null: false, foreign_key: true
      t.belongs_to :expense_type_specification, null: false, foreign_key: true
      t.belongs_to :deputy, null: false, foreign_key: true

      t.timestamps
    end
  end
end

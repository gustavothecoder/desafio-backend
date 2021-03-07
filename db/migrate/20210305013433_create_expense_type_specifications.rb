class CreateExpenseTypeSpecifications < ActiveRecord::Migration[6.0]
  def change
    create_table :expense_type_specifications do |t|
      t.text :description
      t.belongs_to :expense_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end

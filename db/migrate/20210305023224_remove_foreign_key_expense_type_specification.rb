class RemoveForeignKeyExpenseTypeSpecification < ActiveRecord::Migration[6.0]
  def change
    remove_column :expenses, :expense_type_specification_id
  end
end

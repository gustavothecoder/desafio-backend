class ChangeColumnDocumentNumber < ActiveRecord::Migration[6.0]
  def change
    change_column :expenses, :document_number, :string
  end
end

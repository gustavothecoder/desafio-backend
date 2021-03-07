class ChangeValueColumns < ActiveRecord::Migration[6.0]
  def change
    change_column :expenses, :document_value, :decimal, precision: 9, scale: 2
    change_column :expenses, :gloss_value, :decimal, precision: 9, scale: 2
    change_column :expenses, :net_value, :decimal, precision: 9, scale: 2
  end
end

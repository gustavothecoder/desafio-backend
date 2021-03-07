class ChangeColumnPoliticalParty < ActiveRecord::Migration[6.0]
  def change
    change_column :deputies, :political_party, :string, limit: 255
  end
end

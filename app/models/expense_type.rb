# frozen_string_literal: true

class ExpenseType < ApplicationRecord
  has_one :expense_type_specification
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:expense) { create(:expense) }

  describe 'associations' do
    describe 'belongs_to :expense_type' do
      it { expect(expense.expense_type).to be_instance_of(ExpenseType) }
    end

    describe 'belongs_to :expense_type' do
      it { expect(expense.deputy).to be_instance_of(Deputy) }
    end
  end
end

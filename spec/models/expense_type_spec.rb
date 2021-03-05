# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpenseType, type: :model do
  let(:expense_type) { create(:expense_type) }
  let!(:expense_type_specification) { create(:expense_type_specification, expense_type: expense_type) }

  describe 'associations' do
    describe 'belongs_to :expense_type' do
      it { expect(expense_type.expense_type_specification).to be_instance_of(ExpenseTypeSpecification) }
    end
  end
end

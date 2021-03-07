# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpenseTypeSpecification, type: :model do
  let(:expense_type_specification) { create(:expense_type_specification) }

  describe 'associations' do
    describe 'belongs_to :expense_type' do
      it { expect(expense_type_specification.expense_type).to be_instance_of(ExpenseType) }
    end
  end
end

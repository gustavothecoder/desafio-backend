# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Deputy, type: :model do
  let(:deputy) { create(:deputy) }

  describe 'associations' do
    describe 'belongs_to :legislature' do
      it { expect(deputy.legislature).to be_instance_of(Legislature) }
    end

    describe 'has_many :expenses' do
      it 'should have relation with two expenses' do
        expense = create(:expense, deputy: deputy)
        other_expense = create(:expense, deputy: deputy)
        expect(deputy.expenses.count).to eq(2)
        expect(deputy.expenses).to include(expense)
        expect(deputy.expenses).to include(other_expense)
      end
    end
  end
end

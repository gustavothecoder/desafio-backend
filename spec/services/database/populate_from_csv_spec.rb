# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Database::PopulateFromCsv, type: :service do
  describe 'when an error occurs' do
    before(:all) do
      csv = Rack::Test::UploadedFile.new('spec/fixtures/bad_csv.csv')
      @result = Database::PopulateFromCsv.call(csv)
    end

    it 'should return false' do
      expect(@result).to be(false)
    end

    it 'should not create records' do
      expect(Legislature.count).to eq(0)
      expect(Deputy.count).to eq(0)
      expect(ExpenseType.count).to eq(0)
      expect(ExpenseTypeSpecification.count).to eq(0)
      expect(Expense.count).to eq(0)
    end
  end

  context 'when the database is successfully populated ' do
    before(:all) do
      csv = Rack::Test::UploadedFile.new('spec/fixtures/test.csv')
      @result = Database::PopulateFromCsv.call(csv)
    end

    it 'should return true' do
      expect(@result).to be(true)
    end

    it 'should only create the 2019 legislature' do
      expect(Legislature.count).to eq(1)
      expect(Legislature.first.year).to eq(2019)
    end

    it 'should only create deputies Osmar Terra and Cacá Leão' do
      expect(Deputy.count).to eq(2)
      expect(Deputy.first.name).to eq('Osmar Terra')
      expect(Deputy.second.name).to eq('Cacá Leão')
    end

    it 'should only create SP deputies' do
      expect(Deputy.where("state != 'SP'").empty?).to be(true)
    end

    it 'should have only one expense' do
      expect(Deputy.find_by_name('Osmar Terra').expenses.count).to eq(1)
    end

    it 'should have two expenses' do
      expect(Deputy.find_by_name('Cacá Leão').expenses.count).to eq(2)
    end

    it 'should only create the expense type COMBUSTÍVEIS E LUBRIFICANTES' do
      expect(ExpenseType.count).to eq(1)
      expect(ExpenseType.first.description).to eq('COMBUSTÍVEIS E LUBRIFICANTES.')
    end

    it 'should only create the expense type specification Veículos Automotores' do
      expect(ExpenseTypeSpecification.count).to eq(1)
      expect(ExpenseTypeSpecification.first.description).to eq('Veículos Automotores')
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DatabaseController, type: :request do
  describe 'POST /populate_from_csv' do
    before(:each) do
      Legislature.destroy_all
      ExpenseType.destroy_all
    end

    context 'when the database is successfully populated ' do
      it 'should redirect to deputies_path' do
        csv = Rack::Test::UploadedFile.new('spec/fixtures/test.csv')
        post populate_from_csv_path, params: { data: csv }
        expect(response).to redirect_to(deputies_path)
      end
    end

    context 'when there is an error on the first line of the CSV' do
      it 'should return error: Não foi possível extrair os dados' do
        csv = Rack::Test::UploadedFile.new('spec/fixtures/first_line_error.csv')
        post populate_from_csv_path, params: { data: csv }
        expect(flash[:alert]).to eq('Não foi possível extrair os dados')
      end
    end

    context 'when there is an error on the second line of the CSV ' do
      it 'should redirect to deputies_path' do
        csv = Rack::Test::UploadedFile.new('spec/fixtures/second_line_error.csv')
        post populate_from_csv_path, params: { data: csv }
        expect(response).to redirect_to(deputies_path)
      end
    end
  end
end

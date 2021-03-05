# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DatabaseController, type: :request do
  describe 'POST /populate_from_csv' do
    describe 'when an error occurs' do
      it 'should return error: Não foi possível extrair os dados' do
        csv = Rack::Test::UploadedFile.new('spec/fixtures/bad_csv.csv')
        post populate_from_csv_path, params: { data: csv }
        expect(flash[:alert]).to eq('Não foi possível extrair os dados')
      end
    end

    context 'when the database is successfully populated ' do
      it 'should redirect to deputies_path' do
        csv = Rack::Test::UploadedFile.new('spec/fixtures/test.csv')
        post populate_from_csv_path, params: { data: csv }
        expect(response).to redirect_to(deputies_path)
      end
    end
  end
end

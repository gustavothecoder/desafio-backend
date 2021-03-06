# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  include ApplicationHelper

  describe '#summarize_name' do
    context 'when only the first name is present' do
      it 'should return only the first name' do
        expect(summarize_name('First')).to eq('First')
      end
    end

    context 'when three name are present' do
      it 'should return only the first and last names' do
        expect(summarize_name('First Second Last')).to eq('First Last')
      end
    end
  end
end

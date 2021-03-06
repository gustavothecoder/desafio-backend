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

  describe '#format_time' do
    it 'should return 25/12/20' do
      time = Time.new(2020, 12, 25, 10, 24, 25)
      expect(format_time(time)).to eq('25/12/20')
    end
  end
end

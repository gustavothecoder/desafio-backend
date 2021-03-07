# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Legislature, type: :model do
  let(:legislature) { create(:legislature) }

  describe 'associations' do
    describe 'has_many :deputies' do
      let!(:deputy) { create(:deputy, legislature: legislature) }
      let!(:other_deputy) { create(:deputy, legislature: legislature) }

      it { expect(legislature.deputies.count).to eq(2) }
      it { expect(legislature.deputies).to include(deputy) }
      it { expect(legislature.deputies).to include(other_deputy) }
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Deputy, type: :model do
  let(:deputy) { create(:deputy) }

  describe 'associations' do
    describe 'belongs_to :legislature' do
      it { expect(deputy.legislature).to be_instance_of(Legislature) }
    end
  end
end

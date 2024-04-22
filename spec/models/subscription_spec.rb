require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'Associations' do
    it 'belongs to subcriber' do
      association = described_class.reflect_on_association(:subcriber)
      expect(association.macro).to eq :belongs_to
    end
    it 'belongs to subcriber_to' do
      association = described_class.reflect_on_association(:subcriber_to)
      expect(association.macro).to eq :belongs_to
    end
  end
end

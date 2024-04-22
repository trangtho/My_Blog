require 'rails_helper'

RSpec.describe Postcategory, type: :model do
  describe 'Associations' do
    it 'belongs to post' do
      association = described_class.reflect_on_association(:post)
      expect(association.macro).to eq :belongs_to
    end
    it 'belongs to category' do
      association = described_class.reflect_on_association(:category)
      expect(association.macro).to eq :belongs_to
    end
  end
end

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Associations' do
    it 'has many postcategory' do
      association = described_class.reflect_on_association(:postcategories)
      expect(association.macro).to eq :has_many
    end
  end
  describe 'Validations' do
    subject { FactoryBot.create :category }
    it 'is valid with valid attributes' do
      is_expected.to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      is_expected.to_not be_valid
    end
  end
end

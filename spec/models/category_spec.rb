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
    it 'is not valid if name is not unique' do
      category1 = FactoryBot.create(:category)
      subject.name = category1.name
      expect(subject).to be_invalid
    end
    it 'is not valid if name is longer than 50' do
      is_expected.to_not validate_length_of(:name).is_at_least(51)
    end
  end
end

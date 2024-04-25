require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
    it 'has many comment' do
      association = described_class.reflect_on_association(:comments)
      expect(association.macro).to eq :has_many
    end
    it 'has many postcategory' do
      association = described_class.reflect_on_association(:postcategories)
      expect(association.macro).to eq :has_many
    end
  end

  describe 'Validations' do
    subject { FactoryBot.create :post }
    it 'is valid with valid attributes' do
      is_expected.to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      is_expected.to_not be_valid
    end

    it 'is not valid if content is shorter than 5' do
      is_expected.to_not validate_length_of(:content).is_at_most(4)
    end
  end
end

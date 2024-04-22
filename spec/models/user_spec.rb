require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it 'has many post' do
      association = described_class.reflect_on_association(:posts)
      expect(association.macro).to eq :has_many
    end
    it 'has many comment' do
      association = described_class.reflect_on_association(:comments)
      expect(association.macro).to eq :has_many
    end
    it 'has many subcriber' do
      association = described_class.reflect_on_association(:subcribers)
      expect(association.macro).to eq :has_many
    end
    it 'has many subcriber_to' do
      association = described_class.reflect_on_association(:subcriber_tos)
      expect(association.macro).to eq :has_many
    end
  end

  describe 'Validations' do
    subject { FactoryBot.create :user }
    it 'is valid with valid attributes' do
      is_expected.to be_valid
    end

    it 'is not valid without a username' do
      subject.username = nil
      is_expected.to_not be_valid
    end

    it 'is not valid without a email' do
      subject.email = nil
      is_expected.to_not be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      is_expected.to be_valid
    end
  end
end

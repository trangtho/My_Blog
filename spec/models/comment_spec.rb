require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
    it 'belongs to post' do
      association = described_class.reflect_on_association(:post)
      expect(association.macro).to eq :belongs_to
    end
  end
  describe 'Validations' do
    subject { FactoryBot.create :comment }
    it 'is valid with valid attributes' do
      is_expected.to be_valid
    end

    it 'is not valid without a content' do
      subject.content = nil
      is_expected.to_not be_valid
    end
  end
end
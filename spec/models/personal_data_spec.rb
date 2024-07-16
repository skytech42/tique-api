# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PersonalData, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:identifier_number) }
  it { should validate_presence_of(:identifier_type) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:last_name) }

  describe '#email' do
    it 'is valid with valid attributes' do
      personal_data = build :personal_data
      expect(personal_data).to be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with a duplicate email' do
      create :personal_data, email: 'test@example.com'
      duplicate_usuario = build :personal_data, email: 'test@example.com'
      expect(duplicate_usuario).not_to be_valid
    end
  end

  describe '#identifier_number' do
    it 'is not valid without an identifier_number' do
      subject.identifier_number = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with a duplicate identifier_number' do
      create :personal_data, identifier_number: '1234567890'
      duplicate_usuario = build :personal_data, identifier_number: '1234567890'
      expect(duplicate_usuario).not_to be_valid
    end
  end
end

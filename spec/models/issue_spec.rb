require 'rails_helper'

RSpec.describe Issue, type: :model do
  describe 'relationships' do
    it { is_expected.to belong_to(:reporter) }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }

    it 'defines an enum for status' do
      expect(subject).to define_enum_for(:status)
        .with_values(%i[open waiting closed waiting_confirmation finished])
    end

    it 'defines an enum for priority' do
      expect(subject).to define_enum_for(:priority)
        .with_values(%i[low medium high urgent])
    end
  end
end
